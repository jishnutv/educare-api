const express = require("express");
const { getStudents, getBatches, getCourses } = require("../controllers/faculty");

const router = express.Router();

router.route("/students/:uid/:id").get(getStudents);
router.route("/batches/:uid/:id").get(getBatches);
router.route("/courses/:uid/:id").get(getCourses);

module.exports = router;
