const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const jwt = require("jsonwebtoken");
const validator = require("validator");
const User = require("../models/User");
const env = require("../config/env");
const {
  generateAccessToken,
  generateRefreshToken,
  generatePasswordResetToken,
} = require("../middleware/tokenAuth");
const bcrypt = require("bcrypt");
const readHtmlFile = require("../utils/readHtml");
const nodemailer = require("nodemailer");
const handlebars = require("handlebars");

// @desc      Register user
// @route     GET /api/v1/auth/register
// @access    Public
exports.register = asyncHandler(async (req, res, next) => {
  let { name, email, role, refreshToken } = req.body;

  // Generate hashed password
  const salt = await bcrypt.genSalt(10);
  const password = await bcrypt.hash(req.body.password, salt);

  await User.create({
    name,
    email,
    password,
    role,
    refreshToken,
  })
    .then((data) => {
      return res.status(200).json({
        success: true,
        data: data,
      });
    })
    .catch((err) => {
      return res.status(501).json({
        success: false,
        message: err.message,
        data: [
          {
            message: "Server error",
            error: err.message,
          },
        ],
      });
    });
});

// @desc      Login user
// @route     GET /api/v1/auth/register
// @access    Public
exports.login = asyncHandler(async (req, res, next) => {
  // Get data from request body
  const { email, password } = req.body;

  // Validate email
  if (!validator.isEmail(email))
    return next(new ErrorResponse("Please enter a valid email", 400));

  // Get user from database by email
  const user = await User.findOne({ where: { email: email } });

  // Show error if no user exists
  if (!user)
    return next(new ErrorResponse("No user found with this email", 404));

  // Return true if password matches
  const passwordMatch = await bcrypt
    .compare(password, user.password)
    .then((match) => {
      return match;
    })
    .catch((err) => {
      return next(new ErrorResponse(err.message, 401));
    });

  // If password doesn't match then show error
  if (!passwordMatch)
    return next(new ErrorResponse("Please check your email or password", 401));

  // Generate access token for the current user
  const accessToken = generateAccessToken({ id: user.id });

  // Generate refresh token for the current user
  const refreshToken = generateRefreshToken({ id: user.id });

  // Save refresh token to the database
  user.refreshToken = refreshToken;
  await user.save();

  // Send back the Access token and Refresh token
  return res.status(200).json({
    success: true,
    accessToken: accessToken,
    refreshToken: refreshToken,
  });
});

// @desc      Generate new access token if the old one expires
// @route     GET /api/v1/auth/reauth
// @access    Authenticated user
exports.reAuth = asyncHandler(async (req, res, next) => {
  // Get refresh token and id from request body
  const refreshToken = req.body.refreshToken;
  const uid = req.body.id;

  // Get user from database by id
  const user = await User.findOne({ where: { id: uid } });

  // Show error if no user exists
  if (!user)
    return next(new ErrorResponse("Please enter a valid email address", 401));

  // Check refresh token is not null
  if (refreshToken == null)
    return next(new ErrorResponse("Invalid authentication credential", 401));

  // Compare current refresh token with user refresh token
  if (!user.refreshToken.includes(refreshToken))
    return next(new ErrorResponse("Refused to re-authenticate", 403));

  // Verify refresh token with jwt
  jwt.verify(refreshToken, env.refreshTokenSecret, (err, user) => {
    if (err)
      return next(new ErrorResponse("Server refused to re-authenticate", 403));
    const accessToken = generateAccessToken({ id: user.id });

    // Send back access token
    return res.status(200).json({ accessToken: accessToken });
  });
});

// @desc      Reset password
// @route     GET /api/v1/auth/reset-password
// @access    Public
exports.resetPassword = asyncHandler(async (req, res, next) => {
  // Get email from request body
  const email = req.body.email;

  // Validate email
  if (!validator.isEmail(email))
    return next(new ErrorResponse("Please enter a valid email", 400));

  // Get user from database by email
  const user = await User.findOne({ where: { email: email } });

  // Show error if no user exists
  if (!user)
    return next(new ErrorResponse("No user registered with this email", 404));

  // Generate password reset token
  const token = generatePasswordResetToken({ id: user.id, email: user.email });

  // Create password reset link
  const link = `http://localhost:4200/${token}`;
  const html = await readHtmlFile("/templates/reset-password.html");

  if (!html) return next(new ErrorResponse("Failde to send email", 404));

  const template = handlebars.compile(html);

  // Create template replacement object
  let replacements = {
    name: user.name,
    link: link,
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
    from: `"Password reset" <${env.email.email_user}>`,
    to: user.email,
    subject: "You requested to reset your password",
    text: "",
    html: htmlToSend,
  });

  if (!send)
    return next(new ErrorResponse("Failed to send password reset email", 403));

  // Return the response
  return res.status(200).json({
    success: true,
    msg: "Password reset link has been sent to your email",
    to: send.envelope.to[0],
  });
});

// @desc      Logout
// @route     GET /api/v1/auth/logout
// @access    Public
