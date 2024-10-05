const express = require('express');
const router = express.Router();
const pool = require('../config/db'); // Assuming you have a PostgreSQL pool setup

// Route to handle user signup
router.post('/signup', async (req, res) => {
  const { username, email, password } = req.body;

  try {
	// Check if username or email already exists
	const userCheckQuery = 'SELECT * FROM users WHERE username = $1 OR email = $2';
	const userCheckResult = await pool.query(userCheckQuery, [username, email]);

	if (userCheckResult.rows.length > 0) {
	  // Username or email already exists
	  return res.status(400).json({ error: 'Username or email already exists' });
	}

	// Insert the new user into the database
	const insertUserQuery = 'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *';
	const insertUserResult = await pool.query(insertUserQuery, [username, email, password]);

	// Respond with the created user
	res.status(201).json(insertUserResult.rows[0]);
  } catch (error) {
	console.error('Error creating user:', error);
	res.status(500).json({ error: 'Internal server error' });
  }
});

router.post('/login', login);

module.exports = router;

