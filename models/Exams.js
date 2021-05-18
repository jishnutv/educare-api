const DataTypes = require('sequelize');
const db = require('../config/db')

const Exams = db.define('exams', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    title: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.STRING
    },
    date: {
      type: DataTypes.STRING
    },
    start_time: {
      type: DataTypes.STRING
    },
    end_time: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Exams;