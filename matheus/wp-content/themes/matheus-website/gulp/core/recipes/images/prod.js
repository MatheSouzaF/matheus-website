const gulp = require('gulp');
const plumber = require('gulp-plumber');
const notify = require('gulp-notify');
const cache = require('gulp-cache');
const webp = require('gulp-webp');


// utils
const pumped = require('../../utils/pumped');

// config
const config = require('../../config/images');


/**
 * Move Images 
 * to the
 * built theme
 *
 */
module.exports = function () {
	return gulp.src(config.paths.src)
		.pipe(plumber())
		.pipe(webp({ quality: 90 }))
		.pipe(notify({
			"message": pumped("Images have been optimized"),
			"onLast": true
		}))
		.pipe(gulp.dest(config.paths.dest))
};
