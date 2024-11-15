import getCookieByName from './cookies';

function getCurrentLanguage() {
  const wpml_current_language = getCookieByName('wp-wpml_current_language');

  if (wpml_current_language) {
    return wpml_current_language;
  }

  return 'pt-br'; // fallback
}

function localizedNumber(number, maximumFractionDigits = 1, minimumFractionDigits = 1) {

  try {
    return parseFloat(number).toLocaleString(getCurrentLanguage(), {
      maximumFractionDigits,
      minimumFractionDigits
    })

  } catch(error) {
    console.error(error);
    return number;
  }

}


export {localizedNumber, getCurrentLanguage}