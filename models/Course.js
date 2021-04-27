const { DataTypes } = require('sequelize');
const db = require('../config/db')

const Course = db.define('all_course', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
    },
    user_id: {
        type: DataTypes.INTEGER,
    },
    scheme: {
        type: DataTypes.STRING
    },
    curiculam: {
        type: DataTypes.STRING
    },
    title: {
        type: DataTypes.STRING
    },
    certification: {
        type: DataTypes.STRING
    },
    desc_mal: {
        type: DataTypes.STRING
    },
    desc_eng: {
        type: DataTypes.STRING
    },
    course_info: {
        type: DataTypes.STRING
    },
    course_type: {
        type: DataTypes.STRING
    },
    istopten: {
        type: DataTypes.BOOLEAN
    },
    ispopular: {
        type: DataTypes.BOOLEAN
    },
    videolink: {
        type: DataTypes.STRING
    },
    img_name: {
        type: DataTypes.STRING
    },
    img_contrast: {
        type: DataTypes.INTEGER
    },
    offline_fee: {
        type: DataTypes.INTEGER
    },
    online_fee: {
        type: DataTypes.INTEGER
    },
    tax: {
        type: DataTypes.STRING
    },
    n_duration: {
        type: DataTypes.INTEGER
    },
    n_type: {
        type: DataTypes.INTEGER
    },
    f_duration: {
        type: DataTypes.INTEGER
    },
    type: {
        type: DataTypes.STRING

    },
    f_type: {
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

module.exports = Course;