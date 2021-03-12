const path = require("path");
const express = require("express");
const morgan = require("morgan");
const colors = require("colors");
const errorHandler = require("./middleware/error");
const cors = require("cors");
const rfs = require("rotating-file-stream");
const env = require("./config/env");

// Route files
const auth = require("./routes/auth");

// Initialize express
const app = express();

var corsOptions = {
  origin: "http://localhost:8100",
};

app.use(cors(corsOptions));

app.disable("etag");

// Body parser
app.use(express.json());

// create a rotating write stream
const accessLogStream = rfs.createStream('auth.access.log', {
  interval: '1d', // rotate daily
  path: path.join(__dirname, 'log')
})

if (env.env === "development") {
  app.use(morgan("dev", { stream: accessLogStream }));
}

// Set static folder
app.use(express.static(path.join(__dirname, "public")));

// Mount routers
app.use("/api/v1/auth", auth);

app.use(errorHandler);

// Server
const PORT = env.authPort || 4000;

const server = app.listen(PORT, () => {
  console.log(
    `Server running in ${env.env} mode on port ${env.authPort}`.yellow.bold
  );
});

// Handle unhandled promise rejections
process.on("unhandledRejection", (err, promise) => {
  console.log(`Error: ${err.message}`.red.bold);

  // Close server & exit process
  server.close(() => process.exit(1));
});
