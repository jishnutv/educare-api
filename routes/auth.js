const express = require('express');
const { register, login, reAuth } = require('../controllers/auth');

const router = express.Router();

router.post('/register', register);
router.post("/login", login);
router.post("/reauth", reAuth);

module.exports = router;