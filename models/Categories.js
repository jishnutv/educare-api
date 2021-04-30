const DataTypes = require('sequelize');
const db = require('../config/db')

const Categories = db.define('categories', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    icon: {
      type: DataTypes.STRING
    },
    title: {
      type: DataTypes.STRING
    },
    color: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Categories;