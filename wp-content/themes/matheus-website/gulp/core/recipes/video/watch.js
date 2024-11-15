var gulp   = require('gulp');

// config
var config = require('../../config/video');


/**
 * Watch video files
 * for changes
 *
 * @param done
 */
module.exports = function (done) {

	gulp.watch(config.paths.watch, gulp.parallel('video:dev'));

	done();
};
