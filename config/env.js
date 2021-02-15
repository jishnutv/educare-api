const dotenv = require('dotenv');
dotenv.config({ path: './config/config.env' });

module.exports = {

    env: process.env.NODE_ENV,
    port: process.env.PORT,

    db: {
        name: process.env.DB_NAME,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        dialect: process.env.DIALECT,
        host: process.env.HOST
    }
}