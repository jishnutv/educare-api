const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Student = require("../models/Student");
const Schemes = require("../models/Schemes");
const StudentCourse = require("../models/StudentCourse");

// @desc      Get student profile
// @route     GET /api/v1/student
// @access    Private
exports.getStudent = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.body;

  // Get current login student from database by id
  const student = await Student.findOne({ where: { user_id: uid, id: id } });

  // Show error if no student exists
  if (!student) return next(new ErrorResponse("Failed to get student data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: student
  });
});

// @desc      Get student profile
// @route     GET /api/v1/student
// @access    Private
exports.getStudentCourse = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student course
  const course = await StudentCourse.findOne({ where: { user_id: uid, id: id } });

  // Show error if no course exists
  if (!course) return next(new ErrorResponse("Failed to get course data", 404));

  // Get current student scheme
  const scheme = await Schemes.findAll({ where: { user_id: uid, id: course.scheme } });

  // Show error if no scheme exists
  if (!scheme) return next(new ErrorResponse("Failed to get course data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    course,
    scheme
  });
});

