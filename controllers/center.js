const asyncHandler = require("../middleware/async");
const UserProfile = require("../models/UserProfile");
const ErrorResponse = require("../utils/errorResponse");

// @desc      Get centers
// @route     GET /api/v1/centers
// @access    Public
exports.getCenters = asyncHandler(async (req, res, next) => {

  const centers = await UserProfile.findAll();

  if (!centers)
    return next(new ErrorResponse("No centers found found", 404));

  res.status(200).json({
    success: true,
    centers
  });
});
