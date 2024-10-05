const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: 'localhost', // Use 'localhost' for local connections
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: 5432, // Ensure this matches the listening port
});

const testConnection = async () => {
  try {
    const client = await pool.connect();
    console.log('Database connected successfully');
    client.release();
  } catch (err) {
    console.error('Error connecting to the database', err);
  }
};

testConnection();
