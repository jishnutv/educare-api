const { DataTypes } = require('sequelize');
const db = require('../config/db')

const Course = db.define('courses', {
    title: {
        type: DataTypes.STRING
    },
    img: {  
        type: DataTypes.STRING
    },
    img_contrast: {
        type: DataTypes.NUMBER
    },
    content_ml: {
        type: DataTypes.STRING
    },
    content_en: {
        type: DataTypes.STRING
    },
    enrolled: {
        type: DataTypes.NUMBER
    },
    is_top_ten: {
        type: DataTypes.BOOLEAN
    },
    is_popular: {
        type: DataTypes.BOOLEAN
    },
    online: {
        type: DataTypes.BOOLEAN
    }
})

module.exports = Course;