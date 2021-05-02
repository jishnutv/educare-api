const path = require("path");
const express = require("express");
const morgan = require("morgan");
const colors = require("colors");
const errorHandler = require("./middleware/error");
const db = require("./config/db");
var cors = require("cors");
const { tokenAuth } = require("./middleware/tokenAuth");
const rfs = require("rotating-file-stream");
const env = require("./config/env");

// Route files
const auth = require("./routes/auth");
const facultyAuth = require("./routes/faculty.auth");
const course = require("./routes/course");
const contact = require("./routes/contact");
const student = require("./routes/student");
const categories = require("./routes/categories");
const about = require("./routes/about");

// Initialize express
const app = express();

// Cors config
var whitelist = [
  "http://192.168.43.237:8100",
  "http://localhost:8100",
  "http://localhost",
  "capacitor://localhost",
];
var corsOptions = {
  origin: function (origin, callback) {
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      callback(new Error("You are not allowed here"));
    }
  },
};

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Cache-Control, Pragma, Origin, Authorization, Content-Type, X-Requested-With, X-User"
  );
  res.header("Access-Control-Allow-Methods", "GET, PUT, POST");
  if ("OPTIONS" === req.method) {
    res.status(204).send();
  } else {
    next();
  }
});

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

// Create a rotating write stream
const accessLogStream = rfs.createStream("auth.access.log", {
  interval: "1d", // rotate daily
  path: path.join(__dirname, "log"),
});

if (env.env === "development") {
  app.use(morgan("dev", { stream: accessLogStream }));
}

// Set static folder
app.use(express.static(path.join(__dirname, "public")));

// Mount routers
app.use("/api/v1/auth", auth);
app.use("/api/v1/auth", facultyAuth);
app.use("/api/v1/courses", course);
app.use("/api/v1/student", student);
app.use("/api/v1/categories", categories);
app.use("/api/v1/about", about);
app.use("/api/v1", contact);

// Error Handler
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
