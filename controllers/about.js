const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const UserProfile = require("../models/UserProfile");
const Teams = require("../models/Teams");
const Services = require("../models/Services");

// @desc      Get about
// @route     GET /api/v1/about
// @access    Public
exports.getAbout = asyncHandler(async (req, res, next) => {
  const user = req.params.uid;

  const profile = await UserProfile.findOne({
    where: { user_id: user },
    include: [
      {
        model: Teams,
        as: "centerTeams"
      },
      {
        model: Services,
        as: "centerServices"
      }
    ],
  });

  if (!profile && !teams && !services)
    return next(new ErrorResponse("About data not found", 404));

  res.status(200).json({
    success: true,
    data: profile
  });
});
