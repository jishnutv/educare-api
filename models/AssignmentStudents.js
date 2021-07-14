const DataTypes = require("sequelize");
const db = require("../config/db");
const Assignment = require("./Assignment");

const AssignmentStudents = db.define(
  "assignment_students",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    assignment_id: {
      type: DataTypes.INTEGER,
    },
    student_id: {
      type: DataTypes.INTEGER,
    },
    batch_id: {
      type: DataTypes.INTEGER,
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

Assignment.hasMany(AssignmentStudents, {
  foreignKey: "assignment_id",
  as: "student",
});
AssignmentStudents.belongsTo(Assignment, {
  foreignKey: "assignment_id",
  as: "assignment",
});

module.exports = AssignmentStudents;
