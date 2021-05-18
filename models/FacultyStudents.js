const DataTypes = require('sequelize');
const db = require('../config/db')

const FacultyStudents = db.define('facultystudents', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    faculty_id: {
      type: DataTypes.INTEGER
    },
    student_id: {
      type: DataTypes.INTEGER
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = FacultyStudents;