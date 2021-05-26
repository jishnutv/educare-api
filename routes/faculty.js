const express = require("express");
const {
  getStudents,
  getBatches,
  getCourses,
  addAttendanceBatch,
  addExam,
  studentsByBatch,
  getProfile,
  getStudentProfile
} = require("../controllers/faculty");

const router = express.Router();

router.route("/:uid/:id").get(getProfile);
router.route("/students/:uid/:id").get(getStudents);
router.route("/student/:uid/:id").get(getStudentProfile);
router.route("/batches/:uid/:id").get(getBatches);
router.route("/courses/:uid/:id").get(getCourses);
router.route("/batch-students/:uid/:bid").get(studentsByBatch);
router.route("/add-attendance").post(addAttendanceBatch);
router.route("/add-exam").post(addExam);

module.exports = router;
