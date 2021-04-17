const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Course = require("../models/Course");
const env = require("../config/env");

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  const { uid } = req.body;
  console.log(token);
  Course.findAll({where: {user_id: uid}})
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
});

// @desc      Get single course
// @route     GET /api/v1/courses/:id
// @access    Public
exports.getCourse = asyncHandler(async (req, res, next) => {
  const uid = req.body
  await Course.findOne({
    where: {
      id: req.params.id,
      user_id: uid,
      type: "C"
    },
  })
    .then((course) => {
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
      });
    })
    .catch((err) => {
      next(
        new ErrorResponse(`No courses found with the id: ${req.params.id}`, 404)
      );
    });
});
