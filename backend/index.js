require('dotenv').config(); // load .env

const express = require('express');
const cors = require('cors');
const pool = require('./config/db');
const userRoutes = require('./routes/userRoutes'); // import user routes

const app = express();
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || '0.0.0.0'; // allow any network 

// Middleware setup
app.use(cors()); // allow cors req
app.use(express.json()); //parse json req

// Use user routes
app.use('/api/users', userRoutes);

app.get('/', (req, res) => {
    res.send('Welcome to Trajet API!');
});

app.listen(PORT, HOST, () => {
    console.log(`Server is running on http://${HOST}:${PORT}`);
});