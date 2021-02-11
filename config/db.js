const { Sequelize } = require('sequelize');
const colors = require('colors');

const db = async () => {
    const db = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
        host: 'localhost',
        dialect: "mysql"
    });
    
    try {
        await db.authenticate();
        console.log(`Connection has been established successfully.`.blue.bold);
    } catch (error) {
        console.error(`Unable to connect to the database:, ${error}`.red.bold)
    }

    return db;
}

module.exports = db;
