const express = require('express');
const cors = require('cors');
const app = express();
const PORT = process.env.PORT || 5000;
const HOST = process.env.HOST || '0.0.0.0'; // Bind to all network interfaces

// Middleware setup
app.use(cors()); // Allow Cross-Origin requests
app.use(express.json()); // To parse JSON requests

// Example: Defining user routes
const userRoutes = require('./routes/userRoutes'); 
app.use('/api/users', userRoutes); // Setting up the path for user-related API requests

// Starting the server
app.listen(PORT, HOST, () => {
    console.log(`Server is running on http://${HOST}:${PORT}`);
});