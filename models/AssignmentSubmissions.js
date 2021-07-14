const DataTypes = require("sequelize");
const db = require("../config/db");
const Student = require("./Student");

const AssignmentSubmissions = db.define(
  "assignment_submissions",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    student_id: {
      type: DataTypes.INTEGER,
    },
    assignment_id: {
      type: DataTypes.INTEGER,
    },
    title: {
      type: DataTypes.STRING,
    },
    message: {
      type: DataTypes.STRING,
    },
    content: {
      type: DataTypes.STRING,
    },
    status: {
      type: DataTypes.STRING,
    },
    obtainedpoint: {
      type: DataTypes.NUMBER,
    },
    faculty_remarks: {
      type: DataTypes.STRING,
    },
    verifeied_on: {
      type: DataTypes.STRING,
    },
    created_at: {
      type: DataTypes.STRING,
    },
    updated_at: {
      type: DataTypes.STRING,
    },
  },
  { timestamps: false }
);

Student.hasMany(AssignmentSubmissions, {
  foreignKey: "student_id",
  as: "submissions",
});
AssignmentSubmissions.belongsTo(Student, {
  foreignKey: "student_id",
  as: "student",
});

module.exports = AssignmentSubmissions;
