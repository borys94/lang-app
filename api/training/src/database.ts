import {Pool, PoolClient} from 'pg';

import keys from "../keys"

class Database {
  private _client?: PoolClient;

  get client(): PoolClient {
    if (!this._client) {
      throw new Error("Cannot access PostgreSQL client before connecting");
    }
    return this._client
  }

  public async connect(): Promise<PoolClient> {
    const client = new Pool({
      user: keys.pgUser,
      host: keys.pgHost,
      database: keys.pgDatabase,
      password: keys.pgPassword,
      port: ((keys as any).pgPort) as number,
    });
    const poolClient = await client.connect();
    this._client = poolClient;
    return poolClient;
  }
}

export default new Database();