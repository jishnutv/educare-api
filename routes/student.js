const express = require('express');
const {
    getStudent,
    getStudentCourse,
    getAttendance
} = require('../controllers/student');

const router = express.Router();

router
    .route('/')
    .post(getStudent)

router
    .route('/courses/:uid/:id')
    .get(getStudentCourse)

router
    .route('/attendance/:uid/:id')
    .get(getAttendance)

module.exports = router;