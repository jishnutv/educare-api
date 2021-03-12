const asyncHandler = require("../middleware/async");
const nodemailer = require("nodemailer");
const Enquiry = require("../models/Enquiry");
const handlebars = require("handlebars");
const env = require("../config/env");
var fs = require("fs");
var path = require("path");

const readHTMLFile = function (path, callback) {
  fs.readFile(path, { encoding: "utf-8" }, function (err, html) {
    if (err) {
      throw err;
      callback(err);
    } else {
      callback(null, html);
    }
  });
};

// @desc      Enquiry Form
// @route     GET /api/v1/send-enquiry
// @access    Public
exports.sendEnquiry = asyncHandler(async (req, res, next) => {
  let {
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    subject,
    education,
    message,
  } = req.body;
  let { createdAt, updatedAt } = Date.now();

  await Enquiry.create({
    course_id,
    course_title,
    name,
    place,
    phone,
    email,
    education,
    message,
    createdAt,
    updatedAt,
  })
    .then((data) => {
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

      readHTMLFile(
        path.dirname(require.main.filename) + "/views/contact.html",
        async function (err, html) {
          let template = handlebars.compile(html);
          let replacements = {
            course_title: course_title,
            name: name,
            place: place,
            phone: phone,
            email: email,
            education: education,
            msg: message,
          };

          let htmlToSend = template(replacements);

          await transporter
            .sendMail({
              from: `"Jishnu T V" <${env.email.email_user}>`,
              to: env.email.email_to,
              subject: subject,
              text: "",
              html: htmlToSend,
            })
            .then((out) => {
              if (out) {
                return res.status(200).json({
                  success: true,
                  msg: "Your enquiry has bee send.",
                  data: data,
                });
              }
            })
            .catch((err) => {
              if (err) {
                return res.status(200).json({
                  success: false,
                  data: "Email not send",
                  error: err,
                });
              }
            });
        }
      );
    })
    .catch((err) => {
      return res.status(501).json({
        success: false,
        data: [
          {
            message: "Server error",
            error: err.response,
          },
        ],
      });
    });
});
