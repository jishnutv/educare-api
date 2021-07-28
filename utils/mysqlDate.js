function twoDigits(d) {
  if (0 <= d && d < 10) return "0" + d.toString();
  if (-10 < d && d < 0) return "-0" + (-1 * d).toString();
  return d.toString();
}

Date.prototype.toMysqlDateTime = function () {
  return (
    this.getFullYear() +
    "-" +
    twoDigits(1 + this.getMonth()) +
    "-" +
    twoDigits(this.getDate()) +
    " " +
    twoDigits(this.getHours()) +
    ":" +
    twoDigits(this.getMinutes()) +
    ":" +
    twoDigits(this.getSeconds())
  );
};

Date.prototype.toMysqlTime = function () {
  return (
    twoDigits(this.getHours()) +
    ":" +
    twoDigits(this.getMinutes()) +
    ":" +
    twoDigits(this.getSeconds())
  );
};

Date.prototype.toMysqlDate = function () {
  return (
    this.getFullYear() +
    "-" +
    twoDigits(1 + this.getMonth()) +
    "-" +
    twoDigits(this.getDate())
  );
};

const mysqlDateTime = (date) => {
  let d = new Date(date);
  return d.toMysqlDateTime();
};

const mysqlDate = (date) => {
  let d = new Date(date);
  return d.toMysqlDate();
};

const mysqlTime = (date) => {
  let d = new Date(date);
  return d.toMysqlTime();
};

module.exports = {
  mysqlDateTime,
  mysqlDate,
  mysqlTime
};
