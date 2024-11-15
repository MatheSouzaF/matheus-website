var gulp = require('gulp');
var babel = require('gulp-babel');
var plumber = require('gulp-plumber');
var named = require('vinyl-named');
var webpack = require('webpack');
var gulpWebpack = require('webpack-stream');
var browserSync = require('browser-sync');
var rename = require('gulp-rename');
var gulpIf = require('gulp-if');

// utils
var deepMerge = require('../../utils/deepMerge');
var logStats = require('../../utils/webpackLogStats');
var notifaker = require('../../utils/notifaker');
var pumped = require('../../utils/pumped');
var notify = require('gulp-notify');

// config
var config = require('../../config/scripts');


/**
 * Create JS packages
 * with webpack
 *
 * @returns {*}
 */
module.exports = function () {
	return gulp.src(config.paths.src)
		.pipe(plumber())
		.pipe(babel())
		.pipe(named()) 	// vinyl-named is used to allow for
		// multiple entry files
		.pipe(gulpWebpack(
			deepMerge(
				config.options.webpack.defaults,
				config.options.webpack.dev
			), webpack, function (err, stats) {
				logStats(err, stats);
				// reload browser-sync when
				// a package is updated
				browserSync.reload();
				notifaker(pumped('JS Packaged'));
			})
		)
		.pipe(
      gulpIf(
        "main.js",
        rename({ suffix: ".min" })
      )
    )
		.pipe(gulp.dest(config.paths.dest));
};
