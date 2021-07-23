const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Course = require("../models/Course");
const Lessons = require("../models/Lessons");
const Tags = require("../models/Tags");
const { Op } = require("sequelize");

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
  const { uid } = req.params;
  const { category, tag } = req.query;

  if (category) {
    Course.findAll({
      where: { user_id: uid, cat_id: category, type="C", type="P" },
    })
      .then((courses) => {
        res.status(200).json({
          success: true,
          data: courses,
        });
      })
      .catch((err) => {
        next(new ErrorResponse("No courses found", 404));
      });
  } else if (tag) {
    Course.findAll({
      where: {
        user_id: uid,
        tags: {
          [Op.substring]: tag,
        },
      },
    })
      .then((courses) => {
        res.status(200).json({
          success: true,
          courses,
        });
      })
      .catch((err) => {
        next(new ErrorResponse("No courses found", 404));
      });
  } else {
    Course.findAll({
      where: { user_id: uid },
      order: [["id", "DESC"]],
    })
      .then((courses) => {
        if (!courses) return next(new ErrorResponse("No courses found", 404));
        res.status(200).json({
          success: true,
          courses,
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
  const { uid } = req.params;
  await Course.findOne({
    where: {
      id: req.params.id,
      user_id: uid,
    },
    include: [
      {
        model: Lessons,
        as: "lessons",
      },
    ],
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
