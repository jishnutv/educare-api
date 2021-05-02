const DataTypes = require('sequelize');
const db = require('../config/db')

const Teams = db.define('teams', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    name: {
      type: DataTypes.STRING
    },
    role: {
      type: DataTypes.STRING
    },
    phone: {
      type: DataTypes.STRING
    },
    whatsapp: {
      type: DataTypes.STRING
    },
    facebook: {
      type: DataTypes.STRING
    },
    linkedin: {
      type: DataTypes.STRING
    },
    photo: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Teams;