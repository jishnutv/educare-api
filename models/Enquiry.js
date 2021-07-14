const { DataTypes } = require('sequelize');
const db = require('../config/db')

const Enquiry = db.define('enquiries', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
        type: DataTypes.INTEGER
    },
    course_id: {
        type: DataTypes.INTEGER
    },
    fullname: {
        type: DataTypes.STRING
    },
    qualification: {
        type: DataTypes.STRING
    },
    dob: {
        type: DataTypes.STRING
    },
    gender: {
        type: DataTypes.STRING
    },
    place: {
        type: DataTypes.STRING
    },
    house: {
        type: DataTypes.STRING
    },
    pincode: {
        type: DataTypes.STRING
    },
    state: {
        type: DataTypes.STRING
    },
    district: {
        type: DataTypes.STRING
    },
    phone: {
        type: DataTypes.STRING
    },
    whatsap: {
        type: DataTypes.STRING
    },
    email: {
        type: DataTypes.STRING
    },
    photo: {
        type: DataTypes.STRING
    },
    g_name: {
        type: DataTypes.STRING
    },
    g_relation: {
        type: DataTypes.STRING
    },
    g_specify: {
        type: DataTypes.STRING
    },
    g_occupation: {
        type: DataTypes.STRING
    },
    g_phone: {
        type: DataTypes.STRING
    },
    g_email: {
        type: DataTypes.STRING
    },
    courseid: {
        type: DataTypes.INTEGER
    },
    course_title: {
        type: DataTypes.INTEGER
    },
    course_method: {
        type: DataTypes.STRING
    },
    duration_type: {
        type: DataTypes.STRING
    },
    how_here_about: {
        type: DataTypes.STRING
    },
    some_more: {
        type: DataTypes.STRING
    },
    status: {
        type: DataTypes.STRING
    },
    created_at: {
        type: DataTypes.STRING
    },
    updated_at: {
        type: DataTypes.STRING
    }
}, { timestamps: false });

module.exports = Enquiry;