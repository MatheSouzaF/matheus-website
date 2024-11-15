var del = require('del');

// config
var config = require('../../config/video');


/**
 * Delete all video files
 * within the built theme's
 * asset directory
 *
 */
module.exports = function (done) {
	del(config.paths.clean, { force: true })
		.then(function () { done(); });
};