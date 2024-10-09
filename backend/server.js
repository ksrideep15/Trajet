const express = require('express');
const cors = require('cors');
const db = require('./config/db');
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = process.env.PORT || 5000;
const HOST = process.env.HOST || '0.0.0.0';

app.use(cors());
app.use(express.json());

app.use('/api/users', userRoutes);

const MAX_RETRIES = 5;
const RETRY_DELAY = 5000; // 5 seconds

function connectWithRetry(retries) {
  return db.query('SELECT NOW()')
    .then(() => {
      console.log('Database connected successfully');
      startServer();
    })
    .catch((err) => {
      if (retries > 0) {
        console.log(`Database connection failed. Retrying in ${RETRY_DELAY / 1000} seconds...`);
        setTimeout(() => connectWithRetry(retries - 1), RETRY_DELAY);
      } else {
        console.error('Max retries reached. Unable to connect to the database.');
        process.exit(1);
      }
    });
}

function startServer() {
  app.listen(PORT, HOST, () => {
    console.log(`Server is running on http://${HOST}:${PORT}`);
  });
}

connectWithRetry(MAX_RETRIES);