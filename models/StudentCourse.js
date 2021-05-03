const DataTypes = require('sequelize');
const db = require('../config/db')
const Schemes = require("../models/Schemes");

const StudentCourse = db.define('student_courses', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    course_id: {
      type: DataTypes.INTEGER,
    },
    student_id: {
      type: DataTypes.INTEGER,
    },
    certification: {
      type: DataTypes.STRING
    },
    scheme: {
      type: DataTypes.STRING
    },
    title: {
      type: DataTypes.STRING
    },
    fee: {
      type: DataTypes.STRING
    },
    track: {
      type: DataTypes.STRING
    },
    course_type: {
      type: DataTypes.STRING
    },
    type: {
      type: DataTypes.STRING
    },
    status: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

StudentCourse.belongsTo(Schemes);

module.exports = StudentCourse;