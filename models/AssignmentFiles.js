const DataTypes = require("sequelize");
const db = require("../config/db");
const AssignmentSubmissions = require("./AssignmentSubmissions");

const AssignmentFiles = db.define(
  "assignment_files",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    assignment_id: {
      type: DataTypes.INTEGER,
    },
    submission_id: {
      type: DataTypes.INTEGER,
    },
    student_id: {
      type: DataTypes.INTEGER,
    },
    file: {
      type: DataTypes.STRING,
    },
    file_name: {
      type: DataTypes.STRING,
    },
    f_type: {
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

AssignmentSubmissions.hasMany(AssignmentFiles, {
  foreignKey: "submission_id",
  as: "files",
});
AssignmentFiles.belongsTo(AssignmentSubmissions, {
  foreignKey: "submission_id",
  as: "files",
});

module.exports = AssignmentFiles;
