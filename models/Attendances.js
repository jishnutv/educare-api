const DataTypes = require('sequelize');
const db = require('../config/db')
const Student = require("./Student");

const Attendances = db.define('attandances', {
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

Student.hasMany(Attendances, {foreignKey: "student_id", as: "attendance"});
Attendances.belongsTo(Student, {foreignKey: "student_id", as: "studentInfo"});

module.exports = Attendances;