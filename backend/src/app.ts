import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import routes from './routes';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api', routes);

const PORT = process.env.EXPRESS_PORT || 4000;

app.listen(PORT, () => {
  console.log(`Server running on port5 ${PORT}`);
});
