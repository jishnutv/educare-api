const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Course = require("../models/Course");
const Lessons = require("../models/Lessons");

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
  const { uid, category } = req.query;
  if(category) {
    Course.findAll({where: {user_id: uid, cat_id: category}})
    .then((courses) => {
      if (!courses) return next(new ErrorResponse("No courses found", 404));
      res.status(200).json({
        success: true,
        data: courses,
      });
    })
    .catch((err) => {
      next(new ErrorResponse("No courses found", 404));
    });
  }else {
    Course.findAll({where: {user_id: uid}})
    .then((courses) => {
      if (!courses) return next(new ErrorResponse("No courses found", 404));
      res.status(200).json({
        success: true,
        data: courses
      });
    })
    .catch((err) => {
      next(new ErrorResponse("No courses found", 404));
    });
  }
});

// @desc      Get single course
// @route     GET /api/v1/courses/:id
// @access    Public
exports.getCourse = asyncHandler(async (req, res, next) => {
  const { uid } = req.query;
  await Course.findOne({
    where: {
      id: req.params.id,
      user_id: uid,
      type: "C"
    },
  })
    .then(async (course) => {
      const lesson = await Lessons.findAll({where: {user_id: uid, course_id: course.id}})
      if (!course) {
        return next(
          new ErrorResponse(
            `No course found with the id: ${req.params.id}`,
            404
          )
        );
      }

      res.status(200).json({
        success: true,
        data: course,
        lesson: lesson
      });
    })
    .catch((err) => {
      next(
        new ErrorResponse(`No courses found with the id: ${req.params.id}`, 404)
      );
    });
});
