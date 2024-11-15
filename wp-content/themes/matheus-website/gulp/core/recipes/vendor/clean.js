var del = require('del');

// config
var config = require('../../config/vendor');


/**
 * Delete all vendor files
 * within the built theme's
 * asset directory
 *
 */
module.exports = function (done) {
	del(config.paths.clean, { force: true })
		.then(function () { done(); });
};