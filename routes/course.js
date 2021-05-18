const express = require("express");
const {
  getCourses,
  getCourse,
} = require("../controllers/course");

const router = express.Router();

router.route("/:uid").get(getCourses);
// .post(createCourse);

router.route("/:uid/:id").get(getCourse);
// .put(updateCourse)
// .delete(deleteCourse);

module.exports = router;
