var fs = require('fs');

// Cria ou atualiza arquivo assets_version que define constante PHP para ser utilizada
// para negar o cache a cada novo build

module.exports = function (done) {
  var versionstr = new Date().getTime();
  var str = '<?php define("ASSETS_VERSION", "' + versionstr + '");';
  fs.writeFileSync('./assets_version.php', str);
	done();
};
