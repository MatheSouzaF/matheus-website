function getCookieByName(c_name) {
  let c_value = document.cookie;
  let c_start = c_value.indexOf(` ${  c_name  }=`);

  if (c_start === -1) c_start = c_value.indexOf(`${c_name  }=`);

  if (c_start === -1) {
    c_value = null;
  } else {
    c_start = c_value.indexOf('=', c_start) + 1;
    let c_end = c_value.indexOf(';', c_start);
    if (c_end === -1) {
      c_end = c_value.length;
    }
    c_value = decodeURI(c_value.substring(c_start, c_end));
  }
  return c_value;
}

export default getCookieByName;