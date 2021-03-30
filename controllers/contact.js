const asyncHandler = require("../middleware/async");
const nodemailer = require("nodemailer");
const Enquiry = require("../models/Enquiry");
const handlebars = require("handlebars");
const formatDate = require("../utils/formatDate");
const readHtmlFile = require("../utils/readHtml");
const validator = require("validator");
const ErrorResponse = require("../utils/errorResponse");
const env = require("../config/env");

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

  // Validate email
  if (!validator.isEmail(email))
    return next(new ErrorResponse("Please enter a valid email", 400));

  
  // Add data to database
  const data = await Enquiry.create({
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    subject,
    education,
    message,
    created,
    updated,
  });

  const html = await readHtmlFile("/templates/contact.html");

  if (!html) return next(new ErrorResponse("Failde to send email", 404));

  const template = handlebars.compile(html);

  // Create template replacement object
  let replacements = {
    date: created,
    course_title: data.course_title,
    name: data.name,
    place: data.place,
    phone: data.phone,
    email: data.email,
    education: data.education,
    msg: data.message,
  };

  // Apply replacements to email template
  let htmlToSend = template(replacements);

  // Create email transporter using nodemailer
  let transporter = nodemailer.createTransport({
    host: env.email.email_host,
    port: 587,
    secure: false,
    auth: {
      user: env.email.email_user,
      pass: env.email.email_password,
    },
    tls: {
      rejectUnauthorized: false,
    },
  });

  // Send email
  const send = await transporter.sendMail({
    from: `"${data.name}" <${env.email.email_user}>`,
    to: env.email.email_to,
    subject: data.subject,
    text: "",
    html: htmlToSend,
  });

  if (!send)
    return next(new ErrorResponse("Failed to send your enquiry", 403));

  // Return the response
  return res.status(200).json({
    success: true,
    msg: "Your enquiry has been send",
  });
});
