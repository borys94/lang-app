import {Sequelize} from "sequelize"

import keys from "../keys"

class Database {
  private sequelize?: Sequelize;

  get client(): Sequelize {
    if (!this.sequelize) {
      throw new Error("Cannot access PostgreSQL client before connecting");
    }
    return this.sequelize
  }

  public async connect(): Promise<Sequelize> {
    this.sequelize = new Sequelize(`postgres://${keys.pgUser}:${keys.pgPassword}@example.com:${keys.pgPort}/${keys.pgDatabase}`)
    await this.sequelize.authenticate();
    // const client = new Pool({
    //   user: keys.pgUser,
    //   host: keys.pgHost,
    //   database: keys.pgDatabase,
    //   password: keys.pgPassword,
    //   port: ((keys as any).pgPort) as number,
    // });
    return this.sequelize;
  }
}

export default new Database();
