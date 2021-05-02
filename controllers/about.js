const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const UserProfile = require("../models/UserProfile");
const Teams = require("../models/Teams");
const Services = require("../models/Services");

// @desc      Get about
// @route     GET /api/v1/about
// @access    Public
exports.getAbout = asyncHandler(async (req, res, next) => {
  const user = req.headers["x-user"];

  const profile = await UserProfile.findAll({where: {user_id: user}});
  const teams = await Teams.findAll({where: {user_id: user}});
  const services = await Services.findAll({where: {user_id: user}});

  if(!profile && !teams && !services) return next(new ErrorResponse("About data not found", 404));

  res.status(200).json({
    success: true,
    profile, teams, services
  });
});