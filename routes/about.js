const express = require("express");
const { getAbout } = require("../controllers/about");

const router = express.Router();

router.route("/:uid").get(getAbout);

module.exports = router;