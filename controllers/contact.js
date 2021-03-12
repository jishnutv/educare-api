const asyncHandler = require('../middleware/async');
const nodemailer = require("nodemailer");
const Enquiry = require('../models/Enquiry')
const handlebars = require("handlebars");
const formatDate = require("../utils/formatDate");
const readHTMLFile = require("../utils/readHtml");
const ErrorResponse = require("../utils/errorResponse");
const env = require('../config/env')
const path = require('path');

// @desc      Enquiry Form
// @route     GET /api/v1/send-enquiry
// @access    Public
exports.sendEnquiry = asyncHandler(async (req, res, next) => {
  let { course_id, course_title, name, place, phone, email, subject, education, message } = req.body;
  let created = formatDate(new Date)
  let updated = formatDate(new Date)

  await Enquiry.create({
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    education,
    message,
    created,
    updated
  }).then((data) => {

    let transporter = nodemailer.createTransport({
      host: env.email.email_host,
      port: 587,
      secure: false,
      auth: {
        user: env.email.email_user,
        pass: env.email.email_password
      },
      tls: {
        rejectUnauthorized: false
      }
    });

    readHTMLFile(path.dirname(require.main.filename) + '/views/contact.html', async function (err, html) {
      let template = handlebars.compile(html);
      let replacements = {
        date: created,
        course_title: course_title,
        name: name,
        place: place,
        phone: phone,
        email: email,
        education: education,
        msg: message
      };

      let htmlToSend = template(replacements);

      await transporter.sendMail({
        from: `"${email}" <${env.email.email_user}>`,
        to: env.email.email_to,
        subject: `${subject}`,
        text: "",
        html: htmlToSend
      }).then((out) => {
        if (out) {
          return res.status(200).json({
            success: true,
            msg: "Your enquiry has been send.",
            data: data
          })
        }
      }).catch(err => {
        return next(new ErrorResponse(err.message, 401));
      })
    })

  }).catch(err => {
    return next(new ErrorResponse(err.message, 401));
  })
});