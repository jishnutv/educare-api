function twoDigits(d) {
  if (0 <= d && d < 10) return "0" + d.toString();
  if (-10 < d && d < 0) return "-0" + (-1 * d).toString();
  return d.toString();
}

const mysqlDateTime = (date) => {
  let d = new Date(date);
  return (
    d.getFullYear() +
    "-" +
    twoDigits(1 + d.getMonth()) +
    "-" +
    twoDigits(d.getDate()) +
    " " +
    twoDigits(d.getHours()) +
    ":" +
    twoDigits(d.getMinutes()) +
    ":" +
    twoDigits(d.getSeconds())
  );
};

const mysqlDate = (date) => {
  let d = new Date(date);
  return (
    d.getFullYear() +
    "-" +
    twoDigits(1 + d.getMonth()) +
    "-" +
    twoDigits(d.getDate())
  );
};

const mysqlTime = (date) => {
  let d = new Date(date);
  return (
    twoDigits(d.getHours()) +
    ":" +
    twoDigits(d.getMinutes()) +
    ":" +
    twoDigits(d.getSeconds())
  );
};

module.exports = {
  mysqlDateTime,
  mysqlDate,
  mysqlTime
};
