const { DataTypes } = require("sequelize");
const db = require("../config/db");

const Student = db.define("students", {
  id : {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  user_id: {
    type: DataTypes.INTEGER
  },
  name: {
    type: DataTypes.STRING
  },
  qualification: {
    type: DataTypes.STRING
  },
  reg_number: {
    type: DataTypes.STRING
  },
  custom_reg_num: {
    type: DataTypes.STRING
  },
  dob: {
    type: DataTypes.STRING
  },
  photo: {
    type: DataTypes.STRING
  },
  house_name: {
    type: DataTypes.STRING
  },
  place: {
    type: DataTypes.STRING
  },
  district: {
    type: DataTypes.STRING
  },
  pincode: {
    type: DataTypes.STRING
  },
  state: {
    type: DataTypes.STRING
  },
  phone: {
    type: DataTypes.INTEGER
  },
  whatsapp: {
    type: DataTypes.STRING
  },
  email: {
    type: DataTypes.STRING
  },
  g_name: {
    type: DataTypes.STRING
  },
  g_occup: {
    type: DataTypes.STRING
  },
  g_relation: {
    type: DataTypes.STRING
  },
  g_specify: {
    type: DataTypes.STRING
  },
  g_phon: {
    type: DataTypes.STRING
  },
  g_email: {
    type: DataTypes.STRING
  },
  day: {
    type: DataTypes.INTEGER
  },
  month: {
    type: DataTypes.INTEGER
  },
  year: {
    type: DataTypes.INTEGER
  },
  financial_year: {
    type: DataTypes.STRING
  },
  added: {
    type: DataTypes.INTEGER
  },
  updated: {
    type: DataTypes.INTEGER
  },
  last_update: {
    type: DataTypes.STRING
  },
  password: {
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

Student.prototype.toJSON = function () {
  const values = Object.assign({}, this.get());
  delete values.password;
  return values;
};

module.exports = Student;
