// userRoutes.js

const express = require('express');
const router = express.Router();
const { signUp, login } = require('../controllers/userController'); // Importing the login and signUp functions

// Route to handle user signup
router.post('/signup', signUp);

// Route to handle user login
router.post('/login', login);

module.exports = router;
