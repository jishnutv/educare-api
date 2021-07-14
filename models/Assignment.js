const DataTypes = require("sequelize");
const db = require("../config/db");
const AssignmentFiles = require("./AssignmentFiles");
const Course = require("./Course");
const Lessons = require("./Lessons");
const Modules = require("./Modules");

const Assignments = db.define(
  "assignements",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    course_id: {
      type: DataTypes.INTEGER,
    },
    module_id: {
      type: DataTypes.INTEGER,
    },
    lesson_id: {
      type: DataTypes.INTEGER,
    },
    title: {
      type: DataTypes.STRING,
    },
    description: {
      type: DataTypes.STRING,
    },
    content: {
      type: DataTypes.STRING,
    },
    last_date: {
      type: DataTypes.STRING,
    },
    point: {
      type: DataTypes.NUMBER,
    },
    file1: {
      type: DataTypes.STRING,
    },
    file2: {
      type: DataTypes.STRING,
    },
    file3: {
      type: DataTypes.STRING,
    },
    image1: {
      type: DataTypes.STRING,
    },
    image2: {
      type: DataTypes.STRING,
    },
    image3: {
      type: DataTypes.STRING,
    },
    status: {
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

Assignments.hasMany(AssignmentFiles, {
  foreignKey: "assignment_id",
  as: "files",
});
Course.hasMany(Assignments, { foreignKey: "course_id", as: "assignment" });
Assignments.belongsTo(Course, { foreignKey: "course_id", as: "course" });

Lessons.hasMany(Assignments, { foreignKey: "lesson_id", as: "assignment" });
Assignments.belongsTo(Lessons, { foreignKey: "lesson_id", as: "lesson" });

Modules.hasMany(Assignments, { foreignKey: "module_id", as: "assignment" });
Assignments.belongsTo(Modules, { foreignKey: "module_id", as: "module" });

module.exports = Assignments;
