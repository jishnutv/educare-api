const fs = require("fs");
var path = require("path");

const readHtmlFile = (fileName) => {
  return new Promise((resolve, reject) => {
    const appDir = path.dirname(require.main.filename);
    fs.readFile(path.join(appDir, fileName), "utf8", (error, htmlString) => {
      if (!error && htmlString) {
        resolve(htmlString);
      } else {
        reject(error);
      }
    });
  });
};

module.exports = readHtmlFile;
