const express = require('express');
const {
    getStudent,
    getStudentCourse
} = require('../controllers/student');

const router = express.Router();

router
    .route('/')
    .post(getStudent)

router
    .route('/courses')
    .get(getStudentCourse)

module.exports = router;