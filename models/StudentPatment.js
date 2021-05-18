const DataTypes = require('sequelize');
const db = require('../config/db');
const Course = require('./Course');
const StudentBills = require('./StudentBills');

const StudentPayment = db.define('student_payments', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    course_id: {
      type: DataTypes.INTEGER
    },
    student_id: {
      type: DataTypes.INTEGER
    },
    bill_id: {
      type: DataTypes.INTEGER
    },
    discount_rs: {
      type: DataTypes.STRING
    },
    discount_per: {
      type: DataTypes.STRING
    },
    dis_per_in_amount: {
      type: DataTypes.STRING
    },
    payment_amount: {
      type: DataTypes.STRING
    },
    day: {
      type: DataTypes.STRING
    },
    month: {
      type: DataTypes.STRING
    },
    year: {
      type: DataTypes.STRING
    },
    financial_year: {
      type: DataTypes.STRING
    },
    created_at: {
      type: DataTypes.STRING
    },
    updated_at: {
      type: DataTypes.STRING
    }
}, { timestamps: false });

StudentBills.hasMany(StudentPayment, {foreignKey: "bill_id", as: "payment"});
StudentPayment.belongsTo(StudentBills, {foreignKey: "bill_id", as: "payment"});

module.exports = StudentPayment;