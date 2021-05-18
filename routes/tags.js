const express = require("express");
const { getTags } = require("../controllers/tags");

const router = express.Router();

router.route("/:uid").get(getTags);

module.exports = router;