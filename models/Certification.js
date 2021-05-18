const DataTypes = require('sequelize');
const db = require('../config/db');
const Course = require('./Course');
const StudentCourse = require('./StudentCourse');

const Certification = db.define('certifications', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    title: {
      type: DataTypes.INTEGER
    },
    description: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Certification;