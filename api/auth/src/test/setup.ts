import database from "../database"
import { migrate } from "../migrate"
import "./helpers";

beforeAll(async () => {
  await database.connect("auth_test_postgres");
  await dropAllTables()
  await migrate();
});

afterAll(async () => {
  await dropAllTables();
})

beforeEach(async () => {
  const queries = (await database.client.query(`
    SELECT
      'TRUNCATE "' || tablename || '" CASCADE;' as query
    from
      pg_tables WHERE schemaname = 'public' AND tablename != 'migrations';
  `)).rows;
  for (let q of queries) {
    await database.client.query(q.query);
  }
});

const dropAllTables = async () => {
  const queries = (await database.client.query(`
    SELECT
      'DROP TABLE IF EXISTS "' || tablename || '" CASCADE;' as query
    from
      pg_tables WHERE schemaname = 'public';
  `)).rows;
  for (let q of queries) {
    await database.client.query(q.query);
  }
}