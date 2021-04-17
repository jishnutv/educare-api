const express = require("express");
const {
  login,
  logout,
  reAuth,
  resetPassword,
  changePassword,
} = require("../controllers/faculty.auth");

const router = express.Router();

// router.post("/register", register);
router.post("/faculty/login", login);
router.post("/faculty/logout", logout);
router.post("/faculty/reauth", reAuth);
router.post("/faculty/reset-password", resetPassword);
router.post("/faculty/change-password", changePassword);

module.exports = router;
