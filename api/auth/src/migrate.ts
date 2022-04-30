import { promisify } from 'util';
import fs from "fs";
import path from "path"

import Database from "./database"

export async function migrate() {
  const client = await Database.client;
  
  let existingMigrations: string[] = [];
  try {
    let result = await client.query("SELECT * FROM migrations");
    existingMigrations = result.rows.map(r => r.file)
  } catch {
    // console.warn("First migration");
  }
  
  // Get outstanding migrations
  const outstandingMigrations = await getOutstandingMigrations(
    existingMigrations
  );
  

  try {
    // Start transaction
    await client.query("BEGIN");
	
	// Run each migration sequentially in a transaction
    for (let migration of outstandingMigrations) {
	  // Run the migration
      await client.query(migration.query.toString());
	  // Keep track of the migration
      await client.query("INSERT INTO migrations (file) VALUES ($1)", [
        migration.file,
      ]);
    }
	
	// All good, we can commit the transaction
    await client.query("COMMIT");
    // Don't forget to release the client!
    client.release();
    // process.exit(0)
  } catch (err) {
    // Oops, something went wrong, rollback!
    await client.query("ROLLBACK");
    // Don't forget to release the client!
    client.release();
    process.exit(1)
  }
}

async function getOutstandingMigrations(migrations: string[]) {
  const files = await promisify(fs.readdir)(path.join(__dirname, "migrations"));
  const sql = await Promise.all(
    files
      .filter((file) => file.split(".")[1] === "sql")
      .filter((file) => !migrations.includes(file))
      .map(async (file) => ({
        file,
        query: await promisify(fs.readFile)(`${__dirname}/migrations/${file}`, {
          encoding: "utf-8",
        }),
      }))
  );

  return sql;
}

// migrate();