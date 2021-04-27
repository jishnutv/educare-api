const express = require('express');
const {
    getStudent,
} = require('../controllers/student');

const router = express.Router();

router
    .route('/')
    .post(getStudent)

module.exports = router;