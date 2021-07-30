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
const { mysqlDate, mysqlDateTime, mysqlTime } = require("../utils/mysqlDate");
const Assignments = require("../models/Assignment");
const AssignmentStudents = require("../models/AssignmentStudents");
const AssignmentSubmissions = require("../models/AssignmentSubmissions");
const AssignmentFiles = require("../models/AssignmentFiles");

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
    return next(new ErrorResponse("Failed to get faclulty courses", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    courses,
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
    return next(
      new ErrorResponse("Failed to get faclulty course modules", 404)
    );

  // Return the result
  return res.status(200).json({
    success: true,
    modules,
  });
});

exports.addModule = asyncHandler(async (req, res, next) => {
  const { user_id, course_id, order_id, title, description, status } = req.body;

  const data = await Modules.create({
    user_id,
    course_id,
    order_id,
    title,
    description,
    status,
    created_at: mysqlDateTime(Date.now()),
    updated_at: mysqlDateTime(Date.now()),
  });

  // Show error if course module not added
  if (!data)
    return next(new ErrorResponse("Failed to get faculty course lessons", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: { message: "Module created" },
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
    return next(new ErrorResponse("Failed to create faculty course modules", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    lessons,
  });
});

exports.addLesson = asyncHandler(async (req, res, next) => {
  const {
    user_id,
    course_id,
    module_id,
    order_id,
    title,
    description,
    status,
    content,
    type,
    duration,
    url,
    videlink,
    videosource,
  } = req.body;

  const data = await Lessons.create({
    user_id,
    course_id,
    module_id,
    order_id,
    title,
    description,
    status,
    content,
    type,
    duration: mysqlTime(duration),
    url,
    videlink,
    videosource,
    created_at: mysqlDateTime(Date.now()),
    updated_at: mysqlDateTime(Date.now()),
  });

  // Show error if course lesson not added
  if (!data)
    return next(new ErrorResponse("Failed to create faculty course lessons", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: { message: "Lesson created" },
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

  if (Array.isArray(student_id)) {
    for (s of student_id) {
      const data = await Attendances.create({
        user_id,
        student_id: s,
        batch_id,
        type,
        date: mysqlDate(date),
        intime: mysqlTime(intime),
        outtime: mysqlTime(outtime),
        duration,
        created_at: mysqlDateTime(Date.now()),
        updated_at: mysqlDateTime(Date.now()),
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
      date: mysqlDate(date),
      intime: mysqlTime(intime),
      outtime: mysqlTime(outtime),
      duration,
      created_at: mysqlDateTime(Date.now()),
      updated_at: mysqlDateTime(Date.now()),
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
        },
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

exports.getAssignments = asyncHandler(async (req, res, next) => {
  const { uid } = req.params;

  const assignments = await Assignments.findAll({
    where: { user_id: uid },
  });

  // Show error if no assignment
  if (!assignments) return next(new ErrorResponse("No assignments found", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    assignments,
  });
});

exports.getAssignment = asyncHandler(async (req, res, next) => {
  const { uid, id } = req.params;

  const assignment = await Assignments.findOne({
    where: { user_id: uid, id: id },
    include: [
      {
        model: Course,
        as: "course",
        attributes: ["id", "title"],
      },
      {
        model: Modules,
        as: "module",
        attributes: ["id", "title"],
      },
      {
        model: Lessons,
        as: "lesson",
        attributes: ["id", "title"],
      },
    ],
  });

  // Show error if no assignment
  if (!assignment) return next(new ErrorResponse("No assignment found", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    assignment,
  });
});

// @desc      Add assignment
// @route     GET /api/v1/faculty/add-assignment
// @access    Private
exports.addAssignment = asyncHandler(async (req, res, next) => {
  const {
    user_id,
    student_id,
    batch_id,
    course_id,
    module_id,
    lesson_id,
    title,
    description,
    content,
    last_date,
    point,
    status,
    images,
    files,
  } = req.body;

  const assignment = await Assignments.create({
    user_id,
    course_id,
    module_id,
    lesson_id,
    title,
    description,
    content,
    last_date: mysqlDate(new Date(last_date)),
    point,
    file1: files[0] ? files[0].file_name : "",
    file2: files[1] ? files[1].file_name : "",
    file3: files[2] ? files[2].file_name : "",
    image1: images[0] ? images[0].img_name : "",
    image2: images[1] ? images[1].img_name : "",
    image3: images[2] ? images[2].img_name : "",
    status,
    created_at: mysqlDateTime(Date.now()),
    updated_at: mysqlDateTime(Date.now()),
  });

  // Show error if data not inserted
  if (!assignment)
    return next(new ErrorResponse("Failed to careate assignment", 403));

  if (Array.isArray(student_id)) {
    for (s of student_id) {
      const stAssignment = AssignmentStudents.create({
        user_id,
        assignment_id: assignment.id,
        student_id: s,
        batch_id,
        created_at: mysqlDateTime(Date.now()),
        updated_at: mysqlDateTime(Date.now()),
      });

      // Show error if data not inserted
      if (!stAssignment)
        return next(new ErrorResponse("Failed to add student exam", 403));
    }
    // Return the result
    return res.status(200).json({
      success: true,
      assignment,
    });
  } else {
    const stAssignment = AssignmentStudents.create({
      user_id,
      assignment_id: assignment.id,
      student_id,
      batch_id,
      created_at: mysqlDateTime(Date.now()),
      updated_at: mysqlDateTime(Date.now()),
    });

    // Show error if data not inserted
    if (!stAssignment)
      return next(new ErrorResponse("Failed to add student exam", 403));

    // Return the result
    return res.status(200).json({
      success: true,
      assignment,
    });
  }
});

exports.deleteAssignment = asyncHandler(async (req, res, next) => {
  const { user_id, assignment_id } = req.params;

  try {
    const assStudent = await AssignmentStudents.destroy({
      where: { assignment_id },
    });

    const assSubmission = await AssignmentSubmissions.destroy({
      where: { assignment_id },
    });

    const assFiles = await AssignmentFiles.destroy({
      where: { assignment_id },
    });

    const assignment = await Assignments.destroy({
      where: { id: assignment_id },
    });

    // Return the result
    return res.status(200).json({
      success: true,
      students: `Deleted ${assStudent} rocords`,
      submission: `Deleted ${assSubmission} rocords`,
      files: `Deleted ${assFiles} rocords`,
      assignment: `Deleted ${assignment} rocords`,
    });
  } catch (error) {
    // Return the error
    return next(new ErrorResponse(error, 403));
  }
});

exports.updateAssignment = asyncHandler(async (req, res, next) => {
  const id = req.params.assignment_id;
  const {
    course_id,
    module_id,
    lesson_id,
    title,
    description,
    content,
    last_date,
    point,
    status,
    image1,
    image2,
    image3,
    file1,
    file2,
    file3,
  } = req.body;

  const assignment = await Assignments.update(
    {
      course_id,
      module_id,
      lesson_id,
      title,
      description,
      content,
      last_date,
      point,
      status,
      image1,
      image2,
      image3,
      file1,
      file2,
      file3,
      updated_at: mysqlDateTime(Date.now()),
    },
    { where: { id } }
  );

  if (!assignment)
    return next(new ErrorResponse("Failed to update assignment", 403));

  // Return the result
  return res.status(200).json({
    success: true,
    assignment,
  });
});

exports.getSubmissions = asyncHandler(async (req, res, next) => {
  const { assignment_id } = req.params;

  const submissions = await AssignmentSubmissions.findAll({
    where: { assignment_id },
    attributes: ["id", "title", "status", "created_at", "updated_at"],
    include: [
      {
        model: Student,
        as: "student",
        attributes: [
          "id",
          "name",
          "reg_number",
          "photo",
          "created_at",
          "updated_at",
        ],
      },
    ],
  });

  if (!submissions)
    return next(new ErrorResponse("No submissions found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    submissions,
  });
});

exports.getSubmission = asyncHandler(async (req, res, next) => {
  const { student_id } = req.params;

  const submission = await AssignmentSubmissions.findOne({
    where: { student_id },
    include: [{ model: AssignmentFiles, as: "files" }],
  });

  if (!submission) return next(new ErrorResponse("No submission found!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    submission,
  });
});

exports.verifySubmission = asyncHandler(async (req, res, next) => {
  const {
    student_id,
    assignment_id,
    obtainedpoint,
    faculty_remarks,
    verifeied_on,
  } = req.body;

  const submission = await AssignmentSubmissions.update(
    {
      obtainedpoint,
      faculty_remarks,
      verifeied_on: mysqlDate(verifeied_on),
      status: "verified",
    },
    { where: { student_id, assignment_id } }
  );

  if (!submission)
    return next(new ErrorResponse("Verification not completed!", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    submission,
  });
});

exports.changeStatus = asyncHandler(async (req, res, next) => {
  const { user_id, id, status } = req.body;

  const assiStatus = await Assignments.update(
    {
      status,
    },
    { where: { user_id, id } }
  );

  if (!assiStatus)
    return next(new ErrorResponse("Assignment status not updated", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    assiStatus,
  });
});
