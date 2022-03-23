
// import { app } from './app';

import express from 'express';
// import 'express-async-errors';
import cors from 'cors';

const app = express();
app.set('trust proxy', true);
app.use(cors());
app.use(express.static('public'))

app.use('/', (req, res, next) => {
  console.log(':)', __dirname)
  res.sendFile(`${__dirname}/public/index.html`);
  // res.sendStatus(200)
  // return ":)"
})

const start = async () => {
  app.listen(3000, () => {
    console.log('Listening on port 3000!!!!!!!!');
  });
};

start();
