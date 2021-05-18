const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Tags = require("../models/Tags");

// @desc      Get student profile
// @route     GET /api/v1/student
// @access    Private
exports.getTags = asyncHandler(async (req, res, next) => {
  const { uid } = req.params;

  // Get tags
  const tags = await Tags.findAll({ where: { user_id: uid } });

  // Show error if no tags exists
  if (!tags)
    return next(new ErrorResponse("Failed to get tags data", 404));

  // Return the result
  return res.status(200).json({
    success: true,
    data: tags,
  });
});