var gulp   = require('gulp');

// config
var config = require('../../config/vendor');


/**
 * Watch Vendor files
 * for changes
 *
 * @param done
 */
module.exports = function (done) {

	gulp.watch(config.paths.watch, gulp.parallel('vendor:dev'));

	done();
};
