const express = require("express");
const { sendEnquiry } = require("../controllers/contact");

const router = express.Router();

router.route("/sent-enquiry").post(sendEnquiry);

module.exports = router;
