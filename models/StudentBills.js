const DataTypes = require('sequelize');
const db = require('../config/db');
const Course = require('./Course');

const StudentBills = db.define('student_bills', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    student_id: {
      type: DataTypes.INTEGER
    },
    course_id: {
      type: DataTypes.INTEGER
    },
    total: {
      type: DataTypes.STRING
    },
    day: {
      type: DataTypes.STRING
    },
    month: {
      type: DataTypes.STRING
    },
    year: {
      type: DataTypes.STRING
    },
    financial_year: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

Course.hasMany(StudentBills, {foreignKey: "course_id", as: "course"});
StudentBills.belongsTo(Course, {foreignKey: "course_id", as: "course"});

module.exports = StudentBills;