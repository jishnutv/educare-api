const nodemailer = require("nodemailer");
const handlebars = require("handlebars");
const validator = require("validator");
const { google } = require("googleapis");
const asyncHandler = require("../middleware/async");
const Enquiry = require("../models/Enquiry");
const formatDate = require("../utils/formatDate");
const readHtmlFile = require("../utils/readHtml");
const ErrorResponse = require("../utils/errorResponse");
const env = require("../config/env");

const clientId = env.google.clientId;
const clientSecret = env.google.clientSecret;
const redirectUri = env.google.redirectUri;
const oauthRefreshToken = env.google.refreshToken;

const oAuth2Client = new google.auth.OAuth2(clientId, clientSecret, redirectUri)
oAuth2Client.setCredentials({ refresh_token: oauthRefreshToken })

// @desc      Enquiry Form
// @route     GET /api/v1/send-enquiry
// @access    Public
exports.sendEnquiry = asyncHandler(async (req, res, next) => {
  const accessToken = await oAuth2Client.getAccessToken();
  // Get the data from request body
  let {
    user_id,
    to_email,
    courseid,
    course_title,
    fullname,
    dob,
    gender,
    place,
    phone,
    email,
    qualification,
    some_more,
  } = req.body;

  // Validate email
  if (!validator.isEmail(email))
    return next(new ErrorResponse("Please enter a valid email", 400));

  
  // Add data to database
  const data = await Enquiry.create({
    user_id,
    fullname,
    qualification,
    dob,
    gender,
    place,
    phone,
    email,
    courseid,
    course_title,
    some_more,
  });

  const html = await readHtmlFile("/templates/enquiry.html");

  if (!html) return next(new ErrorResponse("Failde to send email", 404));

  const template = handlebars.compile(html);

  // Create template replacement object
  let replacements = {
    date: data.created_at,
    course_title: data.course_title,
    name: data.fullname,
    place: data.place,
    phone: data.phone,
    email: data.email,
    education: data.qualification,
    msg: data.some_more,
  };

  // Apply replacements to email template
  let htmlToSend = template(replacements);
  
  // Create email transporter using nodemailer
  let transporter = nodemailer.createTransport({
    host: env.email.email_host,
    port: 465,
    secure: true,
    auth: {
      type: "OAuth2",
      user: env.email.email_user,
      clientId: clientId,
      clientSecret: clientSecret,
      refreshToken: oauthRefreshToken,
      accessToken: accessToken
    }
  });

  // Send email
  const send = await transporter.sendMail({
    from: `Edu Care Learning<${env.email.email_user}>`,
    to: to_email,
    subject: "New course enquiry",
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

// @desc      Enquiry Form
// @route     GET /api/v1/contact
// @access    Public
exports.contactUs = asyncHandler(async (req, res, next) => {
  const accessToken = await oAuth2Client.getAccessToken();
  // Get the data from request body
  let {
    user_id,
    to_email,
    fullname,
    phone,
    email,
    subject,
    message
  } = req.body;

  // Validate email
  if (!validator.isEmail(email))
    return next(new ErrorResponse("Please enter a valid email", 400));

  const html = await readHtmlFile("/templates/contact.html");

  if (!html) return next(new ErrorResponse("Failde to send email", 404));

  const template = handlebars.compile(html);

  // Create template replacement object
  let replacements = {
    name: fullname,
    subject: subject,
    phone: phone,
    email: email,
    msg: message
  };

  // Apply replacements to email template
  let htmlToSend = template(replacements);

  // Create email transporter using nodemailer
  let transporter = nodemailer.createTransport({
    host: env.email.email_host,
    port: 465,
    secure: true,
    auth: {
      type: "OAuth2",
      user: env.email.email_user,
      clientId: clientId,
      clientSecret: clientSecret,
      refreshToken: oauthRefreshToken,
      accessToken: accessToken
    }
  });

  // Send email
  const send = await transporter.sendMail({
    from: `Edu Care Learning<${env.email.email_user}>`,
    to: to_email,
    subject: `${fullname} Contacted you`,
    text: "",
    html: htmlToSend,
  });

  if (!send)
    return next(new ErrorResponse("Failed to send request", 403));

  // Return the response
  return res.status(200).json({
    success: true,
    msg: "Your request has been send",
  });
});
