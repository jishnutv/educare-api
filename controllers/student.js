const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Student = require("../models/Student");
const Schemes = require("../models/Schemes");
const Attendances = require("../models/Attendances");
const Course = require("../models/Course");
const Certification = require("../models/Certification");
const StudentPayment = require("../models/StudentPatment");
const StudentBills = require("../models/StudentBills");
const Certificates = require("../models/Certificates");
const Exams = require("../models/Exams");
const ClassStudents = require("../models/ClassStudent");
// const ClassBatches = require("../models/ClassBatches");
const Classes = require("../models/Classes");
const Modules = require("../models/Modules");
const Lessons = require("../models/Lessons");
const ExamStudents = require("../models/ExamStudents");

// @desc      Get student profile
// @route     GET /api/v1/student
// @access    Private
exports.getStudent = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.body;

  // Get current login student from database by id
  const student = await Student.findOne({ where: { user_id: uid, id: id } });

  // Show error if no student exists
  if (!student)
    return next(new ErrorResponse("Failed to get student data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: student,
  });
});

// @desc      Get student profile
// @route     GET /api/v1/student
// @access    Private
exports.getStudentCourse = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student course
  const course = await Student.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Course,
        as: "courses",
        include: [
          {
            model: Schemes,
            as: "course_scheme",
          },
          {
            model: Certification,
            as: "certificate",
          },
        ],
      },
    ],
  });

  // Show error if no course exists
  if (!course) return next(new ErrorResponse("Failed to get course data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: course,
  });
});

// @desc      Get student modules
// @route     GET /api/v1/student/modules
// @access    Private
exports.getModules = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const cid = req.params.cid;

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

// @desc      Get student lessons
// @route     GET /api/v1/student/lessons
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

// @desc      Get student attendance
// @route     GET /api/v1/student/attendance
// @access    Private
exports.getPayment = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;
  const cid = req.params.cid;

  // Get current student attendance
  const payment = await StudentBills.findOne({
    where: { user_id: uid, student_id: id, course_id: cid },
    include: [
      {
        model: Course,
        as: "course",
        where: {
          id: cid,
        },
      },
      {
        model: StudentPayment,
        as: "payment",
        where: {
          course_id: cid,
        },
      },
    ],
  });

  // Show error if no attendance
  if (!payment)
    return next(new ErrorResponse("Failed to get payment data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: payment,
  });
});

// @desc      Get student certificates
// @route     GET /api/v1/student/certificates
// @access    Private
exports.getCertificates = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student certificate
  const certificates = await Certificates.findAll({
    where: { user_id: uid, student_id: id },
  });

  // Show error if no certificate
  if (!certificates)
    return next(new ErrorResponse("Failed to get certificate data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    certificates,
  });
});

// @desc      Get student exams
// @route     GET /api/v1/student/exams
// @access    Private
exports.getExams = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student
  const student = await Student.findOne({
    where: { user_id: uid, id: id },
  });

  // Show error if no student
  if (!student)
    return next(new ErrorResponse("Failed to get student data", 404));

  const exams = await ExamStudents.findAll({
    where: {
      user_id: uid,
      student_id: student.id,
    },
    include: [
      {
        model: Exams,
        as: "exams"
      }
    ]
  })

  // Show error if no exams
  if (!exams) return next(new ErrorResponse("Failed to get course data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    exams,
  });
});

// @desc      Get student classes
// @route     GET /api/v1/student/classes
// @access    Private
exports.getClasses = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  // Get current student
  const student = await Student.findOne({
    where: { user_id: uid, id: id },
  });

  // Show error if no student
  if (!student)
    return next(new ErrorResponse("Failed to get student data", 404));

  // Get student classes
  const classes = await ClassStudents.findAll({
    where: {
      user_id: uid,
      student_id: student.id,
    },
    include: [
      {
        model: Classes,
        as: "class",
      },
    ],
  });

  // Get student batches
  // const batches = await ClassBatches.findAll({
  //   where: {
  //     user_id: uid,
  //     batch_id: student.batch,
  //   },
  //   include: [
  //     {
  //       model: Classes,
  //     },
  //   ],
  // });

  // Check student have batch id or batch
  // if (student.batch) {
  //   // Return the result
  //   return res.status(200).json({
  //     success: true,
  //     class: batches,
  //   });
  // } else {
  //   // Return the result (Student doesn't have batch id or batch)
  //   return res.status(200).json({
  //     success: true,
  //     class: classes,
  //   });
  // }

  return res.status(200).json({
    success: true,
    class: classes,
  });
});
