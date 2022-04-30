import Database from "../src/database";
import {migrate} from "../src/migrate"

const main = async () => {
  await Database.connect();
  await migrate();
}

main();