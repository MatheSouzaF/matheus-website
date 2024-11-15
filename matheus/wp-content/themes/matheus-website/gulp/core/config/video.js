// utils
var deepMerge = require('../utils/deepMerge');

// config
var assets = require('./common').paths.assets;

/**
 * Video Building
 * Configuration
 * Object
 *
 * @type {{}}
 */
module.exports = deepMerge({
	paths: {
		watch: assets.src  + '/video/**/*',
		src:   assets.src  + '/video/**/*',
		dest:  assets.dest + '/video',
		clean: assets.dest + '/video/**/*'
	}
});