const formatDate = (date) => {

  let day = date.getDay();
  let mnth = date.getMonth();
  let year = date.getFullYear();
  let min = date.getMinutes();
  let hr = date.getHours();
  let sec = date.getSeconds();
  let ampm = hr >= 12 ? 'PM' : 'AM';
  hr = hr % 12;
  hr = hr ? hr : 12;

  hr = ("0" + hr).slice(-2);
  min = ("0" + min).slice(-2);
  sec = ("0" + sec).slice(-2);
  day = ("0" + day).slice(-2);
  mnth = ("0" + mnth).slice(-2);

  let dateTime = `${day}/${mnth}/${year} ${hr}:${min}:${sec} ${ampm}`;

  return dateTime;
}

module.exports = formatDate;