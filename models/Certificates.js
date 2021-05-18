const DataTypes = require('sequelize');
const db = require('../config/db')

const Certificates = db.define('certificates', {
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
    register_num: {
      type: DataTypes.STRING
    },
    title: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.STRING
    },
    uploaded: {
      type: DataTypes.STRING
    },
    certificate: {
      type: DataTypes.STRING
    },
    type: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Certificates;