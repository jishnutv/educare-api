const DataTypes = require('sequelize');
const db = require('../config/db')

const CourseTags = db.define('coursetags', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    tag_id: {
      type: DataTypes.INTEGER
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = CourseTags;