const dotenv = require('dotenv');
dotenv.config({ path: './config/config.env' });

module.exports = {

    env: process.env.NODE_ENV,
    port: process.env.PORT,
    authPort: process.env.AUTH_PORT,
    accessTokenSecret: process.env.ACCESS_TOKEN_SECRET,
    refreshTokenSecret: process.env.REFRESH_TOKEN_SECRET,
    passwordResetSecret: process.env.PASSWORD_RESET_SECRET,

    db: {
        name: process.env.DB_NAME,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        dialect: process.env.DIALECT,
        host: process.env.HOST,
    },

    email: {
        email_user: process.env.EMAIL_USER,
        email_password: process.env.EMAIL_PASSWORD,
        email_host: process.env.EMAIL_HOST,
        email_to: process.env.EMAIL_TO
    }
}