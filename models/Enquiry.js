const { DataTypes } = require('sequelize');
const db = require('../config/db')

const Enquiry = db.define('enquiries', {
    course_id: {
        type: DataTypes.NUMBER
    },
    name: {
        type: DataTypes.STRING
    },
    place: {
        type: DataTypes.STRING
    },
    phone: {
        type: DataTypes.STRING
    },
    email: {
        type: DataTypes.STRING,
    },
    qualification: {
        type: DataTypes.STRING
    },
    message: {
        type: DataTypes.STRING
    }
})

module.exports = Enquiry;