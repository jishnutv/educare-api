const DataTypes = require("sequelize");
const db = require("../config/db");
const FacultyStudents = require("../models/FacultyStudents");
const FacultyBatches = require("../models/FacultyBatches");
const FacultyCourses = require("../models/FacultyCourses");
const Batches = require("../models/Batches");
const Student = require("../models/Student");
const Course = require("../models/Course");

const Faculties = db.define(
  "faculiteis",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    faculty_id: {
      type: DataTypes.INTEGER,
    },
    name: {
      type: DataTypes.STRING,
    },
    phone: {
      type: DataTypes.STRING,
    },
    whatsapp: {
      type: DataTypes.STRING,
    },
    profession: {
      type: DataTypes.STRING,
    },
    sex: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
    },
    profile: {
      type: DataTypes.STRING,
    },
    resume: {
      type: DataTypes.STRING,
    },
    photo: {
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

Faculties.belongsToMany(Student, {
  through: FacultyStudents,
  foreignKey: "faculty_id",
  as: "students",
  timestamps: false
});

Faculties.belongsToMany(Batches, {
  through: FacultyBatches,
  foreignKey: "faculty_id",
  as: "batches",
  timestamps: false
});

Faculties.belongsToMany(Course, {
  through: FacultyCourses,
  foreignKey: "course_id",
  as: "courses",
  timestamps: false
});

Student.belongsToMany(Faculties, {
  through: FacultyStudents,
  foreignKey: "student_id",
  as: "faculty",
  timestamps: false
});

Batches.belongsToMany(Faculties, {
  through: FacultyBatches,
  foreignKey: "batch_id",
  as: "faculty",
  timestamps: false
});

Course.belongsToMany(Faculties, {
  through: FacultyCourses,
  foreignKey: "course_id",
  as: "faculty",
  timestamps: false
}); 

module.exports = Faculties;
