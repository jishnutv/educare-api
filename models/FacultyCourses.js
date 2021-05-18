const DataTypes = require('sequelize');
const db = require('../config/db')

const FacultyCourses = db.define('facultycourses', {
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
    course_id: {
      type: DataTypes.INTEGER
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = FacultyCourses;