const express = require("express");
const {
  register,
  login,
  reAuth,
  resetPassword,
  changePassword
} = require("../controllers/auth");

const router = express.Router();

router.post("/register", register);
router.post("/login", login);
router.post("/reauth", reAuth);
router.post("/reset-password", resetPassword);
router.post("/change-password", changePassword);

module.exports = router;
