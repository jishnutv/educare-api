const DataTypes = require('sequelize');
const db = require('../config/db');

const Classes = db.define('classes', {
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
    link: {
      type: DataTypes.INTEGER
    },
    platform: {
      type: DataTypes.STRING
    },
    type: {
      type: DataTypes.STRING
    },
    starttime: {
      type: DataTypes.STRING
    },
    endtime: {
      type: DataTypes.STRING
    },
    date: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Classes;