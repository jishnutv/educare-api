const { Sequelize, DataTypes } = require('sequelize');

const Course = Sequelize.defile('course', {
    title: {
        type: DataTypes.STRING
    },
    img: {
        type: DataTypes.STRING
    },
    imgcontrast: {
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
    istopten: {
        type: DataTypes.BOOLEAN
    },
    ispopular: {
        type: DataTypes.BOOLEAN
    },
    online: {
        type: DataTypes.BOOLEAN
    },
    createdat: {
        type: DataTypes.DATE
    },
    updatedat: {
        type: DataTypes.DATE
    }
})

module.exports = Course;