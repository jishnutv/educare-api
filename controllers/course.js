const asyncHandler = require('../middleware/async');
const Course = require('../models/Course')

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
    Course.findAll().then(courses => {
        console.log(courses.length);
        return res.status(200).json({
            success: true,
            data: courses
        })
    }).catch(err => {
        return res.status(404).json({
            success: err.message,
            data: "Not found",
        });
    })
});

// @desc      Get single course
// @route     GET /api/v1/courses/:id
// @access    Public
exports.getCourse = asyncHandler(async (req, res, next) => {
    await Course.findOne({
        where: {
            id: req.params.id
        }
    }).then((course) => {
        if (course) {
            return res.status(200).json({
                success: true,
                data: course
            })
        } else {
            return res.status(404).json({
                success: false,
                data: "No course found"
            })
        }
    }).catch((err) => {
        return res.status(501).json({
            success: false,
            message: err.message,
            data: [
                {
                    message: "Server error",
                    error: err.message
                }
            ]
        });
    })
});

// @desc      Create new course
// @route     POST /api/v1/courses      
// @access    Private
exports.createCourse = asyncHandler(async (req, res, next) => {
    const crs = await Course.findAll();
    let enrolled = "";
    if(crs != null) {
        enrolled = crs.length + 1;
    }
    let { title, img, img_contrast, content_ml, content_en, is_top_ten, is_popular, online } = req.body;
    let { createdAt, updatedAt } = Date.now();
    await Course.create({
        title,
        img,
        img_contrast,
        content_ml,
        content_en,
        enrolled,
        is_top_ten,
        is_popular,
        online,
        createdAt,
        updatedAt
    }).then((data) => {
        return res.status(200).json({
            success: true,
            data: data
        })
    }).catch(err => {
        return res.status(501).json({
            success: false,
            message: err.message,
            data: [
                {
                    message: "Server error",
                    error: err.message
                }
            ]
        });
    })
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

// @desc      Delete course
// @route     DELETE /api/v1/course/:id
// @access    Private
exports.deleteCourse = asyncHandler(async (req, res, next) => {
    return res.status(200).json({
        success: true,
        data: "Course deleted",
    });
});