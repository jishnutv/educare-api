const express = require('express');
const { sendEnquiry } = require('../controllers/contact');

const router = express.Router();

router
    .route('/')
    .post(sendEnquiry);

module.exports = router;  