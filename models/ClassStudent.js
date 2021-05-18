const DataTypes = require('sequelize');
const db = require('../config/db');
const Classes = require("../models/Classes");

const ClassStudents = db.define('classstudents', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    class_id: {
      type: DataTypes.INTEGER
    },
    student_id: {
      type: DataTypes.INTEGER
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

Classes.hasMany(ClassStudents, {foreignKey: "class_id", as: "student"});
ClassStudents.belongsTo(Classes, {foreignKey: "class_id", as: "class"});

module.exports = ClassStudents;