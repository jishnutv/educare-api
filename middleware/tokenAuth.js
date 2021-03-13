const ErrorResponse = require ("../utils/errorResponse");
const jwt = require('jsonwebtoken');
const env = require("../config/env");
// const User = require("../models/User");

const tokenAuth = ( req, res, next ) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if(token == null) return next(new ErrorResponse("You don't have permission to access this page", 401));

  jwt.verify(token, env.accessTokenSecret, async (err, data) => {
    if(err) return next(new ErrorResponse("Failed to authenticate", 403));
    // let user = await User.findOne({ where: { id: data.id } });
    console.log(data.id);
    req.userId = data.id;
    next();
  })
}

const generateAccessToken = (user) => {
  return jwt.sign(user, env.accessTokenSecret, { expiresIn: '20s' });
}

const generateRefreshToken = (user) => {
  return jwt.sign(user, env.refreshTokenSecret);
}

const generatePasswordResetToken = (user) => {
  const secret = env.refreshTokenSecret+user.password;
  return jwt.sign({ id: user.id }, secret, { expiresIn: "10m" });
}

module.exports = { tokenAuth, generateAccessToken, generateRefreshToken, generatePasswordResetToken };