import database from "../database"
import { migrate } from "../migrate"
import "./helpers";

beforeAll(async () => {
  await database.connect("auth_test_postgres");
  await migrate();
});

afterAll(async () => {
  await database.client.query(`
    DROP TABLE migrations;
    DROP TABLE users;
    DROP TABLE words;
    DROP TABLE word_categories;
  `);
})

beforeEach(async () => {
  await database.client.query(`
    TRUNCATE users CASCADE;
    TRUNCATE words CASCADE;
    TRUNCATE word_categories CASCADE;
  `);
});