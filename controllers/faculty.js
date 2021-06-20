const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Student = require("../models/Student");
const Faculties = require("../models/Faculties");
const Batches = require("../models/Batches");
const Course = require("../models/Course");
const Attendances = require("../models/Attendances");
const Exams = require("../models/Exams");
const ExamStudents = require("../models/ExamStudents");
const Modules = require("../models/Modules");
const Lessons = require("../models/Lessons");

// @desc      Get faculty profile
// @route     GET /api/v1/faculty
// @access    Private
exports.getProfile = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  // Get faculty student profile
  const profile = await Faculties.findOne({
    where: { user_id: uid, faculty_id: id },
  });

  // Show error if no student exists
  if (!profile) return next(new ErrorResponse("Failed to get faculty", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    profile,
  });
});

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
        attributes: [
          "id",
          "user_id",
          "batch",
          "name",
          "reg_number",
          "dob",
          "photo",
        ],
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

// @desc      Get faculty students
// @route     GET /api/v1/faculty/students
// @access    Private
exports.getStudentProfile = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  // Get current faculty student
  const student = await Student.findOne({
    where: { user_id: uid, id: id },
  });

  // Show error if no student exists
  if (!student)
    return next(new ErrorResponse("Failed to get student profile", 404));

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
    courses
  });
});

// @desc      Get faculty course modules
// @route     GET /api/v1/faculty/modules
// @access    Private
exports.getModules = asyncHandler(async (req, res, next) => {
  const { uid, cid } = req.params;

  // Get current student modules
  const modules = await Modules.findAll({
    where: { user_id: uid, course_id: cid },
  });

  // Show error if no modules
  if (!modules)
    return next(new ErrorResponse("Failed to get modules data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    modules,
  });
});

// @desc      Get facultylessons
// @route     GET /api/v1/faculty/lessons
// @access    Private
exports.getLessons = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const mid = req.params.mid;

  // Get current student modules
  const lessons = await Lessons.findAll({
    where: { user_id: uid, module_id: mid },
  });

  // Show error if no lessons
  if (!lessons)
    return next(new ErrorResponse("Failed to get lessons data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    lessons,
  });
});

// @desc      Get students by batch
// @route     GET /api/v1/faculty/students/:uid/:bid
// @access    Private
exports.studentsByBatch = asyncHandler(async (req, res, next) => {
  const { uid, bid } = req.params;

  const students = await Student.findAll({
    where: {
      user_id: uid,
      batch: bid,
    },
    attributes: ["id", "user_id", "batch", "name", "reg_number", "photo"],
  });

  // Show error if no batches exists
  if (!students) return next(new ErrorResponse("Failed to get students", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    students,
  });
});

// @desc      Get faculty attendance
// @route     GET /api/v1/faculty/add-attendance-batch
// @access    Private
exports.addAttendanceBatch = asyncHandler(async (req, res, next) => {
  const {
    user_id,
    student_id,
    batch_id,
    type,
    date,
    intime,
    outtime,
    duration,
  } = req.body;

  const dMs = Date.now();
  const dNow = new Date(dMs);
  const aDate = new Date(date);

  function twoDigits(d) {
    if (0 <= d && d < 10) return "0" + d.toString();
    if (-10 < d && d < 0) return "-0" + (-1 * d).toString();
    return d.toString();
  }

  Date.prototype.toMysqlDateTime = function () {
    return (
      this.getFullYear() +
      "-" +
      twoDigits(1 + this.getMonth()) +
      "-" +
      twoDigits(this.getDate()) +
      " " +
      twoDigits(this.getHours()) +
      ":" +
      twoDigits(this.getMinutes()) +
      ":" +
      twoDigits(this.getSeconds())
    );
  };

  Date.prototype.toMysqlDate = function () {
    return (
      this.getFullYear() +
      "-" +
      twoDigits(1 + this.getMonth()) +
      "-" +
      twoDigits(this.getDate())
    );
  };

  if (Array.isArray(student_id)) {
    for (s of student_id) {
      const data = await Attendances.create({
        user_id,
        student_id: s,
        batch_id,
        type,
        date: aDate.toMysqlDate(),
        intime,
        outtime,
        duration,
        created_at: dNow.toMysqlDateTime(),
        updated_at: dNow.toMysqlDateTime(),
      });

      // Show error if data not inserted
      if (!data)
        return next(new ErrorResponse("Failed to add attendance", 403));
    }

    // Return the result
    return res.status(200).json({
      success: true,
      message: "Attendance added",
    });
  } else {
    const data = await Attendances.create({
      user_id,
      student_id,
      batch_id,
      type,
      date: aDate.toMysqlDate(),
      intime,
      outtime,
      duration,
      created_at: dNow.toMysqlDateTime(),
      updated_at: dNow.toMysqlDateTime(),
    });

    // Show error if data not inserted
    if (!data) return next(new ErrorResponse("Failed to add attendance", 403));

    // Return the result
    return res.status(200).json({
      success: true,
      message: "Attendance added",
    });
  }
});

// @desc      Get faculty attendance
// @route     GET /api/v1/faculty/add-attendance-batch
// @access    Private
exports.addExam = asyncHandler(async (req, res, next) => {
  const {
    user_id,
    student_id,
    title,
    date,
    start_time,
    end_time,
    description,
  } = req.body;

  const dMs = Date.now();
  const dNow = new Date(dMs);
  const eDate = new Date(date);

  function twoDigits(d) {
    if (0 <= d && d < 10) return "0" + d.toString();
    if (-10 < d && d < 0) return "-0" + (-1 * d).toString();
    return d.toString();
  }

  Date.prototype.toMysqlDateTime = function () {
    return (
      this.getFullYear() +
      "-" +
      twoDigits(1 + this.getMonth()) +
      "-" +
      twoDigits(this.getDate()) +
      " " +
      twoDigits(this.getHours()) +
      ":" +
      twoDigits(this.getMinutes()) +
      ":" +
      twoDigits(this.getSeconds())
    );
  };

  Date.prototype.toMysqlDate = function () {
    return (
      this.getFullYear() +
      "-" +
      twoDigits(1 + this.getMonth()) +
      "-" +
      twoDigits(this.getDate())
    );
  };

  const data = await Exams.create({
    user_id,
    title,
    description,
    date: eDate.toMysqlDate(),
    start_time,
    end_time,
    created_at: dNow.toMysqlDateTime(),
    updated_at: dNow.toMysqlDateTime(),
  });

  // Show error if data not inserted
  if (!data) return next(new ErrorResponse("Failed to add exam", 403));

  if (Array.isArray(student_id) && data) {
    for (s of student_id) {
      const stExam = ExamStudents.create({
        user_id,
        student_id: s,
        exam_id: data.id,
        created_at: dNow.toMysqlDateTime(),
        updated_at: dNow.toMysqlDateTime(),
      });

      // Show error if data not inserted
      if (!stExam)
        return next(new ErrorResponse("Failed to add student exam", 403));
    }
    // Return the result
    return res.status(200).json({
      success: true,
      message: "Batch exam added",
    });
  } else {
    const stExam = ExamStudents.create({
      user_id,
      student_id,
      exam_id: data.id,
      created_at: dNow.toMysqlDateTime(),
      updated_at: dNow.toMysqlDateTime(),
    });

    // Show error if data not inserted
    if (!stExam)
      return next(new ErrorResponse("Failed to add student exam", 403));

    // Return the result
    return res.status(200).json({
      success: true,
      message: "Student exam added",
    });
  }
});

// @desc      Get student attendance
// @route     GET /api/v1/student/attendance
// @access    Private
exports.getAttendance = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student attendance
  const attendances = await Student.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Attendances,
        as: "attendance",
        where: {
          user_id: uid,
        }
      },
    ],
  });

  // Show error if no attendance
  if (!attendances)
    return next(new ErrorResponse("Failed to get course data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    attendances,
  });
});
