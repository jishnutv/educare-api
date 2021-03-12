const express = require('express');
const {
    getCourses,
    getCourse,
} = require('../controllers/course');

const router = express.Router();

router
    .route('/')
    .get(getCourses)
    // .post(createCourse);

router
    .route('/:id')
    .get(getCourse)
    // .put(updateCourse)
    // .delete(deleteCourse);

module.exports = router;    