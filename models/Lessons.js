const DataTypes = require('sequelize');
const db = require('../config/db')

const Lessons = db.define('lessons', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    course_id: {
      type: DataTypes.INTEGER
    },
    module_id: {
      type: DataTypes.INTEGER
    },
    order_id: {
      type: DataTypes.INTEGER
    },
    title: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.STRING
    },
    status: {
      type: DataTypes.STRING
    },
    content: {
      type: DataTypes.STRING
    },
    type: {
      type: DataTypes.STRING
    },
    duration: {
      type: DataTypes.STRING
    },
    url: {
      type: DataTypes.STRING
    },
    image1: {
      type: DataTypes.STRING
    },
    image2: {
      type: DataTypes.STRING
    },
    file: {
      type: DataTypes.STRING
    },
    videolink: {
      type: DataTypes.STRING
    },
    videosource: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Lessons;