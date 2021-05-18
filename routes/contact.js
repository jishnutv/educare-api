const express = require("express");
const { sendEnquiry, contactUs } = require("../controllers/contact");

const router = express.Router();

router.route("/sent-enquiry").post(sendEnquiry);
router.route("/contact").post(contactUs);

module.exports = router;
