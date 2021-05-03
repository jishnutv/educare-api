const express = require('express');
const {
    getStudent,
    getStudentCourse
} = require('../controllers/student');

const router = express.Router();

router
    .route('/student')
    .post(getStudent)

router
    .route('/student/courses')
    .get(getStudentCourse)

module.exports = router;