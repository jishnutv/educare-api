const asyncHandler = require("../middleware/async");
const ErrorResponse = require("../utils/errorResponse");
const Course = require("../models/Course");

// @desc      Get all courses
// @route     GET /api/v1/courses
// @access    Public
exports.getCourses = asyncHandler(async (req, res, next) => {
  // Course.findAll()
  //   .then((courses) => {
  //     console.log(courses.length);

  //     if (!courses) {
  //       return next(new ErrorResponse("No courses found", 404));
  //     }

  //     res.status(200).json({
  //       success: true,
  //       data: courses,
  //     });
  //   })
  //   .catch((err) => {
  //     next(new ErrorResponse("No courses found", 404));
  //   });
  res.status(200).json({
    success: true,
    data: "Email",
  });
});

// @desc      Get single course
// @route     GET /api/v1/courses/:id
// @access    Public
exports.getCourse = asyncHandler(async (req, res, next) => {
  await Course.findOne({
    where: {
      id: req.params.id,
    },
  })
    .then((course) => {
      if (!course) {
        return next(
          new ErrorResponse(
            `No course found with the id: ${req.params.id}`,
            404
          )
        );
      }

      res.status(200).json({
        success: true,
        data: course,
      });
    })
    .catch((err) => {
      next(
        new ErrorResponse(`No courses found with the id: ${req.params.id}`, 404)
      );
    });
});

// // @desc      Create new course
// // @route     POST /api/v1/courses
// // @access    Private
// exports.createCourse = asyncHandler(async (req, res, next) => {
//     const crs = await Course.findAll();
//     let enrolled = "";
//     if(crs != null) {
//         enrolled = crs.length + 1;
//     }
//     let { title, img, img_contrast, content_ml, content_en, is_top_ten, is_popular, online } = req.body;
//     let { createdAt, updatedAt } = Date.now();
//     await Course.create({
//         title,
//         img,
//         img_contrast,
//         content_ml,
//         content_en,
//         enrolled,
//         is_top_ten,
//         is_popular,
//         online,
//         createdAt,
//         updatedAt
//     }).then((data) => {
//         return res.status(200).json({
//             success: true,
//             data: data
//         })
//     }).catch(err => {
//         return res.status(501).json({
//             success: false,
//             message: err.message,
//             data: [
//                 {
//                     message: "Server error",
//                     error: err.message
//                 }
//             ]
//         });
//     })
// });

// @desc      Update course
// @route     PUT /api/v1/courses/:id
// @access    Private
// exports.updateCourse = asyncHandler(async (req, res, next) => {
//     return res.status(200).json({
//         success: true,
//         data: "Course updated",
//     });
// });

// @desc      Delete course
// @route     DELETE /api/v1/course/:id
// @access    Private
// exports.deleteCourse = asyncHandler(async (req, res, next) => {
//     return res.status(200).json({
//         success: true,
//         data: "Course deleted",
//     });
// });
