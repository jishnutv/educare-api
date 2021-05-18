const DataTypes = require('sequelize');
const db = require('../config/db')

const FacultyBatches = db.define('facultybatches', {
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
    batch_id: {
      type: DataTypes.INTEGER
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = FacultyBatches;