const path = require("path");
const express = require("express");
const morgan = require("morgan");
const colors = require("colors");
const errorHandler = require("./middleware/error");
const db = require("./config/db");
var cors = require("cors");
const { tokenAuth } = require("./middleware/tokenAuth");
const env = require("./config/env");

// Route files
const course = require("./routes/course");
const contact = require("./routes/contact");

// Initialize express
const app = express();

// Cors config
var whitelist = ['http://localhost:8100', 'http://192.168.1.17:8100'];
var corsOptions = {
  origin: function (origin, callback) {
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  }
}

app.use(cors(corsOptions));

app.disable("etag");

// Check database
try {
  db.authenticate();
  console.log(`Connection has been established successfully.`.blue.bold);
} catch (error) {
  console.error(`Unable to connect to the database:, ${error}`.red.bold);
}

// Body parser
app.use(express.json());

if (env.env === "development") {
  app.use(morgan("dev"));
}

// Set static folder
app.use(express.static(path.join(__dirname, "public")));

// Mount routers
app.use("/api/v1/:uid/courses", course);
app.use("/api/v1", contact);

app.use(errorHandler);

// Server
const PORT = env.port || 5000;

const server = app.listen(PORT, () => {
  console.log(
    `Server running in ${env.env} mode on port ${env.port}`.yellow.bold
  );
});

// Handle unhandled promise rejections
process.on("unhandledRejection", (err, promise) => {
  console.log(`Error: ${err.message}`.red.bold);

  // Close server & exit process
  server.close(() => process.exit(1));
});
