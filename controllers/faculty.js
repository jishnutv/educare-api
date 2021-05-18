const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Student = require("../models/Student");
const Faculties = require("../models/Faculties");
const Batches = require("../models/Batches");
const Course = require("../models/Course");

// @desc      Get faculty students
// @route     GET /api/v1/faculty/students
// @access    Private
exports.getStudents = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  // Get current faculty student
  const student = await Faculties.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Student,
        attributes: ["id", "user_id", "name", "reg_number", "dob", "photo"],
        as: "students",
      },
    ],
  });

  // Show error if no student exists
  if (!student)
    return next(new ErrorResponse("Failed to get student data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: student,
  });
});

// @desc      Get faculty batches
// @route     GET /api/v1/faculty/batches
// @access    Private
exports.getBatches = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  // Get current faculty batches
  const batches = await Faculties.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Batches,
        as: "batches",
      },
    ],
  });

  // Show error if no batches exists
  if (!batches)
    return next(new ErrorResponse("Failed to get faclulty batches", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: batches,
  });
});

// @desc      Get faculty courses
// @route     GET /api/v1/faculty/courses
// @access    Private
exports.getCourses = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  // Get current faculty courses
  const courses = await Faculties.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Course,
        as: "courses",
      },
    ],
  });

  // Show error if no batches exists
  if (!courses)
    return next(new ErrorResponse("Failed to get faclulty batches", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: courses,
  });
});
