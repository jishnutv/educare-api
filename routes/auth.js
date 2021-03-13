const express = require('express');
const { register, login, reAuth, resetPassword } = require('../controllers/auth');

const router = express.Router();

router.post('/register', register);
router.post("/login", login);
router.post("/reauth", reAuth);
router.post("/reset-password", resetPassword);

module.exports = router;