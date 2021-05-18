const DataTypes = require('sequelize');
const db = require('../config/db');
const Exams = require('./Exams');

const ExamStudents = db.define('examstudents', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    student_id: {
      type: DataTypes.INTEGER,
    },
    exam_id: {
      type: DataTypes.INTEGER,
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

Exams.hasMany(ExamStudents, {foreignKey: "exam_id", as: "student"});
ExamStudents.belongsTo(Exams, {foreignKey: "exam_id", as: "exams"});

module.exports = ExamStudents;