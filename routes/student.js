const express = require("express");
const {
  getStudent,
  getStudentCourse,
  getModules,
  getLessons,
  getAttendance,
  getPayment,
  getCertificates,
  getExams,
  getClasses
} = require("../controllers/student");

const router = express.Router();

router.route("/").post(getStudent);

router.route("/courses/:uid/:id").get(getStudentCourse);

router.route("/modules/:uid/:cid").get(getModules);

router.route("/lessons/:uid/:mid").get(getLessons);

router.route("/attendance/:uid/:id").get(getAttendance);

router.route("/payment/:uid/:id/:cid").get(getPayment);

router.route("/certificates/:uid/:id").get(getCertificates);

router.route("/exams/:uid/:id").get(getExams);

router.route("/classes/:uid/:id").get(getClasses);

module.exports = router;
