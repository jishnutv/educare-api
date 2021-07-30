const express = require("express");
const {
  getStudents,
  getBatches,
  getCourses,
  getLessons,
  getModules,
  getAssignments,
  getAssignment,
  getSubmissions,
  getSubmission,
  verifySubmission,
  changeStatus,
  addModule,
  addLesson,
  addAttendanceBatch,
  addExam,
  studentsByBatch,
  getProfile,
  getStudentProfile,
  getAttendance,
  addAssignment,
  deleteAssignment,
  updateAssignment
} = require("../controllers/faculty");

const router = express.Router();

router.route("/profile/:uid/:id").get(getProfile);
router.route("/students/:uid/:id").get(getStudents);
router.route("/student/:uid/:id").get(getStudentProfile);
router.route("/attendance/:uid/:id").get(getAttendance);
router.route("/batches/:uid/:id").get(getBatches);
router.route("/courses/:uid/:id").get(getCourses);
router.route("/modules/:uid/:cid").get(getModules);
router.route("/lessons/:uid/:mid").get(getLessons);
router.route("/batch-students/:uid/:bid").get(studentsByBatch);
router.route("/assignments/:uid").get(getAssignments);
router.route("/assignment/:uid/:id").get(getAssignment);
router.route("/submissions/:assignment_id").get(getSubmissions);
router.route("/submission/:student_id").get(getSubmission);
router.route("/add-attendance").post(addAttendanceBatch);
router.route("/add-exam").post(addExam);
router.route("/add-module").post(addModule);
router.route("/add-lesson").post(addLesson);
router.route("/add-assignment").post(addAssignment);
router.route("/add-assignment").post(addAssignment);
router.route("/verify-submission").post(verifySubmission);
router.route("/change-status").post(changeStatus);
router.route("/update-assignment/:assignment_id").put(updateAssignment);
router.route("/delete-assignment/:assignment_id").delete(deleteAssignment);

module.exports = router;
