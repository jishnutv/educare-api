const { DataTypes } = require("sequelize");
const db = require("../config/db");

const User = db.define("users", {
  name: {
    type: DataTypes.STRING,
  },
  email: {
    type: DataTypes.STRING,
  },
  password: {
    type: DataTypes.STRING,
  },
  role: {
    type: DataTypes.STRING,
  },
  resetPasswordToken: {
    type: DataTypes.STRING,
  },
  refreshToken: {
    type: DataTypes.STRING,
  },
  resetpasswordExpires: {
    type: DataTypes.STRING,
  }
});

User.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());

  delete values.password;
  return values;
};

module.exports = User;
