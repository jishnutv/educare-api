const asyncHandler = require("../middleware/async");
const { mysqlDate, mysqlDateTime } = require("../utils/mysqlDate");
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
const Classes = require("../models/Classes");
const Modules = require("../models/Modules");
const Lessons = require("../models/Lessons");
const ExamStudents = require("../models/ExamStudents");
const Assignments = require("../models/Assignment");
const AssignmentStudents = require("../models/AssignmentStudents");
const AssignmentFiles = require("../models/AssignmentFiles");
const AssignmentSubmissions = require("../models/AssignmentSubmissions");

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

// @desc      Get student courses
// @route     GET /api/v1/student/course
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
  if (!course) return next(new ErrorResponse("No courses found!", 404));

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
    return next(new ErrorResponse("No modules found!", 404));

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
    return next(new ErrorResponse("No lessons found!", 404));

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
        where: {
          user_id: uid,
        },
      },
    ],
  });

  // Show error if no attendance
  if (!attendances)
    return next(new ErrorResponse("No attendance found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    attendances,
  });
});

// @desc      Get student payment
// @route     GET /api/v1/student/payment
// @access    Private
exports.getPayment = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;
  const cid = req.params.cid;

  // Get current student payments
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
    return next(new ErrorResponse("No payments found", 404));

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
    return next(new ErrorResponse("No certificates found!", 404));

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
    return next(new ErrorResponse("Failed to get student", 404));

  const exams = await ExamStudents.findAll({
    where: {
      user_id: uid,
      student_id: student.id,
    },
    include: [
      {
        model: Exams,
        as: "exams",
      },
    ],
  });

  // Show error if no exams
  if (!exams) return next(new ErrorResponse("No exams found!", 404));

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
    return next(new ErrorResponse("Failed to get student", 404));

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

  return res.status(200).json({
    success: true,
    class: classes,
  });
});

// @desc      Get student assignments
// @route     GET /api/v1/student/assignments
// @access    Private
exports.getAssignments = asyncHandler(async (req, res, next) => {
  const uid = req.params.uid;
  const id = req.params.id;

  const assignements = await AssignmentStudents.findAll({
    where: {
      user_id: uid,
      student_id: id,
    },
    include: [
      {
        model: Assignments,
        as: "assignment",
        include: [
          {
            model: Course,
            attributes: ['id', 'title', 'course_type'],
            as: "course"
          },
          {
            model: Modules,
            attributes: ['id', 'title', 'description'],
            as: "module"
          },
          {
            model: Lessons,
            attributes: ['id', 'title', 'description', 'type', 'duration'],
            as: "lesson"
          }
        ],
      }
    ],
  });

  // Show error if no assignments
  if (!assignements)
    return next(new ErrorResponse("No assignments found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    assignements,
  });
});

// @desc      Get student assignments
// @route     GET /api/v1/student/assignments
// @access    Private
exports.getAssignment = asyncHandler(async (req, res, next) => {
  const id = req.params.id;

  const assignement = await Assignments.findOne({
    where: {
      id: id,
    },
    include: [
      {
        model: AssignmentFiles,
        as: "files",
      },
      {
        model: Course,
        attributes: ['id', 'title', 'course_type'],
        as: "course"
      },
      {
        model: Modules,
        attributes: ['id', 'title', 'description'],
        as: "module"
      },
      {
        model: Lessons,
        attributes: ['id', 'title', 'description', 'type', 'duration'],
        as: "lesson"
      }
    ],
  });

  // Show error if no assignments
  if (!assignement)
    return next(new ErrorResponse("No assignment found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    assignement,
  });
});

// @desc      Get student submission
// @route     GET /api/v1/student/submission
// @access    Private
exports.getSubmission = asyncHandler(async (req, res, next) => {
  const { sid, aid } = req.params;

  const submission = await AssignmentSubmissions.findOne({
    where: {
      assignment_id: aid,
      student_id: sid
    },
    include: [
      {
        model: AssignmentFiles,
        as: 'files'
      }
    ]
  })

  // Show error if no submission
  if (!submission)
    return next(new ErrorResponse("No submission found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    submission,
  });
});

exports.submission = asyncHandler(async (req, res, next) => {
  const {
    student_id,
    assignment_id,
    title,
    message,
    content,
    images
  } = req.body;

  const submission = await AssignmentSubmissions.create(
    {
      student_id,
      assignment_id,
      title,
      message,
      content,
      status: "notverified",
      created_at: mysqlDateTime(Date.now()),
      updated_at: mysqlDateTime(Date.now()),
    }
  );

  if (!submission)
    return next(new ErrorResponse("Verification not completed!", 404));

  if(Array.isArray(images)) {

    for(i of images) {
      const submissionFiles = await AssignmentFiles.create({
        assignment_id,
        submission_id: submission.id,
        student_id,
        file_name: i.img_name,
        created_at: mysqlDateTime(Date.now()),
        updated_at: mysqlDateTime(Date.now()),
      });

      if (!submissionFiles)
        return next(new ErrorResponse("File upload failed", 403));
    }
  }

  // Return the result
  return res.status(200).json({
    success: true,
    submission,
  });
});