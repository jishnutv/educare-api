const asyncHandler = require('../middleware/async');

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "All courses",
    });
});

// @desc      Get single course
// @route     GET /api/v1/courses/:id
// @access    Public
exports.getCourse = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "Single course",
    });
});

// @desc      Create new course
// @route     POST /api/v1/courses      
// @access    Private
exports.createCourse = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "Course created",
    });
});

// @desc      Update course
// @route     PUT /api/v1/courses/:id
// @access    Private
exports.updateCourse = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "Course updated",
    });
});

// @desc      Delete bootcamp
// @route     DELETE /api/v1/bootcamps/:id
// @access    Private
exports.deleteCourse = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "Course deleted",
    });
});