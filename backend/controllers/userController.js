const db = require('../config/db');

const signUp = async (req, res) => {
    const { username, email, password } = req.body;

    try {
        const userCheck = await db.query('SELECT * FROM users WHERE email = $1', [email]);

        if (userCheck.rows.length > 0) {
            return res.status(400).json({ error: 'User already exists' });
        }

        const newUser = await db.query(
            'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *',
            [username, email, password]
        );

        res.status(201).json({ message: 'User created successfully', user: newUser.rows[0] });
    } catch (error) {
        console.error('Error in signUp:', error);
        res.status(500).json({ error: 'Server error', details: error.message });
    }
};

const login = async (req, res) => {
    const { email, password } = req.body;

    try {
        const user = await db.query('SELECT * FROM users WHERE email = $1', [email]);

        if (user.rows.length === 0) {
            return res.status(400).json({ error: 'User not found' });
        }

        if (user.rows[0].password !== password) {
            return res.status(400).json({ error: 'Invalid password' });
        }

        res.status(200).json({ message: 'Login successful', user: user.rows[0] });
    } catch (error) {
        console.error('Error in login:', error);
        res.status(500).json({ error: 'Server error', details: error.message });
    }
};

module.exports = { signUp, login };