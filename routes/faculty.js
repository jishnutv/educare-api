const express = require("express");
const {
  getStudents,
  getBatches,
  getCourses,
  addAttendanceBatch,
  studentsByBatch,
  getProfile
} = require("../controllers/faculty");

const router = express.Router();

router.route("/:uid/:id").get(getProfile);
router.route("/students/:uid/:id").get(getStudents);
router.route("/batches/:uid/:id").get(getBatches);
router.route("/courses/:uid/:id").get(getCourses);
router.route("/batch-students/:uid/:bid").get(studentsByBatch);
router.route("/add-attendance-batch").post(addAttendanceBatch);

module.exports = router;
