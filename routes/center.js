const express = require("express");
const { getCenters } = require("../controllers/center");

const router = express.Router();

router.route("/centers").get(getCenters);

module.exports = router;
