const express = require('express');
const {
    getStudent,
} = require('../controllers/student');

const router = express.Router();

router
    .route('/')
    .get(getStudent)

module.exports = router;