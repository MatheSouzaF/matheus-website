// utils
var deepMerge = require('../utils/deepMerge');

// config
var assets = require('./common').paths.assets;

/**
 * Vendor Building
 * Configuration
 * Object
 *
 * @type {{}}
 */
module.exports = deepMerge({
	paths: {
		watch: assets.src  + '/vendor/**/*',
		src:   assets.src  + '/vendor/**/*',
		dest:  assets.dest + '/vendor',
		clean: assets.dest + '/vendor/**/*'
	}
});