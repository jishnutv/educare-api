const asyncHandler = require("../middleware/async");
const nodemailer = require("nodemailer");
const Enquiry = require("../models/Enquiry");
const handlebars = require("handlebars");
const formatDate = require("../utils/formatDate");
const readHTMLFile = require("../utils/readHtml");
const ErrorResponse = require("../utils/errorResponse");
const env = require("../config/env");
const path = require("path");

// @desc      Enquiry Form
// @route     GET /api/v1/send-enquiry
// @access    Public
exports.sendEnquiry = asyncHandler(async (req, res, next) => {
  // Get the data from request body
  let {
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    subject,
    education,
    message,
  } = req.body;

  // Current date and time formatted
  let created = formatDate(new Date());
  let updated = formatDate(new Date());

  // Add data to database
  const data = await Enquiry.create({
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    education,
    message,
    created,
    updated,
  });

  console.log(data);
  //     .then(async(data) => {
  //       // Create email transporter using nodemailer
  //       let transporter = nodemailer.createTransport({
  //         host: env.email.email_host,
  //         port: 587,
  //         secure: false,
  //         auth: {
  //           user: env.email.email_user,
  //           pass: env.email.email_password,
  //         },
  //         tls: {
  //           rejectUnauthorized: false,
  //         },
  //       });

  //       // Read html email template using handlebars
  //       const html = readHTMLFile(path.dirname(require.main.filename) + "/templates/contact.html");

  //       const template = handlebars.compile(html);

  //       // Create template replacement object
  //       let replacements = {
  //         date: created,
  //         course_title: data.course_title,
  //         name: data.name,
  //         place: data.place,
  //         phone: data.phone,
  //         email: data.email,
  //         education: data.education,
  //         msg: data.message,
  //       };

  //       // Apply replacements to email template
  //       let htmlToSend = template(replacements);

  //       // Send email
  //       const send = await transporter
  //         .sendMail({
  //           from: `"${env.email.email_user}" <${env.email.email_user}>`,
  //           to: env.email.email_to,
  //           subject: `${subject}`,
  //           text: "",
  //           html: htmlToSend,
  //         });

  //       console.log(send);

  //       if (!send) return next(new ErrorResponse("Failed to send email", 403));

  //       return res.status(200).json({
  //         success: true,
  //         msg: "Your enquiry has been send.",
  //       });
  //     })
  //     .catch((err) => {
  //       return next(new ErrorResponse(err.message, 401));
  //     });
  // });
});
