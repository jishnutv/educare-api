const path = require('path');
const express = require('express');
const morgan = require('morgan');
const colors = require('colors');
const db = require('./config/db')
const env = require('./config/env')

// Route files
const course = require('./routes/course');

// Initialize express
const app = express();

// Check database
try {
    db.authenticate();
    console.log(`Connection has been established successfully.`.blue.bold);
} catch (error) {
    console.error(`Unable to connect to the database:, ${error}`.red.bold)
}

// Body parser
app.use(express.json());

if (env.env === 'development') {
    app.use(morgan('dev'));
}

// Set static folder
app.use(express.static(path.join(__dirname, 'public')));

// Mount routers
app.use('/api/v1/courses', course);

const PORT = env.port || 5000;

const server = app.listen(PORT, () => {
    console.log(
        `Server running in ${env.env} mode on port ${env.port}`.yellow.bold
    );
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (err, promise) => {
    console.log(`Error: ${err.message}`.red.bold);

    // Close server & exit process
    server.close(() => process.exit(1));
});
