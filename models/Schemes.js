const DataTypes = require('sequelize');
const db = require('../config/db')

const Schemes = db.define('schemes', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    scheme_title: {
      type: DataTypes.STRING
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

module.exports = Schemes;