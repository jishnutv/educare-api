const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const env = require("../config/env");
const {
  generateAccessToken,
  generateRefreshToken,
} = require("../middleware/tokenAuth");
const bcrypt = require("bcrypt");

// @desc      Register user
// @route     GET /api/v1/auth/register
// @access    Public
exports.register = asyncHandler(async (req, res, next) => {
  let {
    name,
    email,
    role,
    refreshToken
  } = req.body;

  // Generate hashed password
  const salt = await bcrypt.genSalt(10);
  const password = await bcrypt.hash(req.body.password, salt);
  // const createdAt = Date.now();
  // const updatedAt = Date.now();

  await User.create({
    name,
    email,
    password,
    role,
    refreshToken
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
  const { email, password } = req.body;
  const user = await User.findOne({ where: { email: email } });
  if (!user) {
    next(new ErrorResponse("Please enter a valid email address", 401));
  } else {
    const passwordMatch = await bcrypt
      .compare(password, user.password)
      .then((res) => {
        return res;
      })
      .catch((err) => {
        next(new ErrorResponse(err.message, 401));
      });

    if (!passwordMatch) {
      next(new ErrorResponse("Please check your email or password", 401));
    } else {
      const userData = {
        id: user.id,
      };
      const accessToken = generateAccessToken(userData);
      const refreshToken = generateRefreshToken(userData);
      user.refreshToken = refreshToken;
      await user.save();
      return res.status(200).json({
        success: true,
        accessToken: accessToken,
        refreshToken: refreshToken,
      });
    }
  }
});

// @desc      Generate access token
// @route     GET /api/v1/auth/reset-password
// @access    Auth user
exports.reAuth = asyncHandler(async (req, res, next) => {
  const refreshToken = req.body.refreshToken;
  const uid = req.body.id;
  const user = await User.findOne({ where: { id: uid } });

  if (refreshToken == null)
    return next(new ErrorResponse("Invalid authentication credential", 401));
  if (!user.refreshToken.includes(refreshToken))
    return next(new ErrorResponse("Refused to re-authenticate", 403));

  jwt.verify(refreshToken, env.refreshTokenSecret, (err, user) => {
    if (err)
      return next(new ErrorResponse("Server refused to re-authenticate", 403));
    const accessToken = generateAccessToken({ id: user.id });
    return res.status(200).json({ accessToken: accessToken });
  });
});

// @desc      Reset password
// @route     GET /api/v1/auth/reset-password
// @access    Public

// @desc      Logout
// @route     GET /api/v1/auth/logout
// @access    Public
