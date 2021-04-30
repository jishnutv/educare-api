const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Categories = require("../models/Categories");

// @desc      Get all categories
// @route     GET /api/v1/categories
// @access    Public
exports.getCategories = asyncHandler(async (req, res, next) => {
  const { uid } = req.query;
  const header = req.headers["uid"];
  const user = header && header.split(" ")[1];
  console.log(header);
  Categories.findAll({where: {user_id: uid}})
    .then((categories) => {
      if (!categories) return next(new ErrorResponse("No categories found", 404));
      res.status(200).json({
        success: true,
        data: categories,
      });
    })
    .catch((err) => {
      next(new ErrorResponse("No categories found", 404));
    });
});