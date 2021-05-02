const DataTypes = require('sequelize');
const db = require('../config/db')

const Attandances = db.define('attandances', {
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
    batch_id: {
      type: DataTypes.INTEGER
    },
    type: {
      type: DataTypes.STRING
    },
    date: {
      type: DataTypes.STRING
    },
    intime: {
      type: DataTypes.STRING
    },
    outtime: {
      type: DataTypes.STRING
    },
    duration: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Attandances;