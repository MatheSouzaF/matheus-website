function write_log(debug_msg) {

  const debug_active = (window.debug_scripts && window.debug_scripts.debug) || false;

  if (!debug_active) {
    return;
  }

  console.log('DEBUG', debug_msg)

}

export { write_log };