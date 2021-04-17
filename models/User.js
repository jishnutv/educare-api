const { DataTypes } = require("sequelize");
const db = require("../config/db");

const User = db.define("students", {
  id : {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  name: {
    type: DataTypes.STRING,
  },
  email: {
    type: DataTypes.STRING
  },
  password: {
    type: DataTypes.STRING
  },
  role: {
    type: DataTypes.STRING
  },
  remember_token: {
    type: DataTypes.STRING
  },
  refreshToken: {
    type: DataTypes.STRING
  },
  passwordResetToken: {
    type: DataTypes.STRING
  },
  created_at: {
    type: DataTypes.STRING
  },
  updated_at: {
    type: DataTypes.STRING
  }
},{ timestamps: false });

// User.prototype.toJSON = function () {
//   const values = Object.assign({}, this.get());
//   delete values.password;
//   return values;
// };

module.exports = User;
