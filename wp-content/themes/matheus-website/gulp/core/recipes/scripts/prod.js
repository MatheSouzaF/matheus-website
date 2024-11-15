var gulp = require('gulp');
var babel = require('gulp-babel');
var plumber = require('gulp-plumber');
var named = require('vinyl-named');
var webpack = require('webpack');
var gulpWebpack = require('webpack-stream');
var notify = require('gulp-notify');
var rename = require('gulp-rename');
const gulpIf = require("gulp-if");

// utils
var deepMerge = require('../../utils/deepMerge');
var pumped = require('../../utils/pumped');

// config
var config = require('../../config/scripts');

/**
 * Create minified JS
 * packages with webpack
 *
 * @returns {*}
 */
module.exports = function () {
	return gulp.src(config.paths.src)
		.pipe(plumber())
		.pipe(babel())
		.pipe(named()) // vinyl-named is used to allow for
		// multiple entry files
		.pipe(gulpWebpack(
			deepMerge(
				config.options.webpack.defaults,
				config.options.webpack.prod
			), webpack
		))
		.pipe(
      gulpIf(
        "main.js",
        rename({ suffix: ".min" })
      )
    )
		.pipe(gulp.dest(config.paths.dest))
		.pipe(notify({
			"message": pumped("JS Packaged & Minified!"),
			"onLast": true
		}));
};
