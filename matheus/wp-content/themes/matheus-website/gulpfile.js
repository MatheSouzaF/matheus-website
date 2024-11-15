/* eslint
no-var: 0,
no-multi-spaces: 0,
no-mixed-spaces-and-tabs: 0,
no-multiple-empty-lines: 0
*/

var gulp = require('gulp');
var log = require('fancy-log');
var c = require('ansi-colors');
// utils
var lazyQuire = require('./gulp/core/utils/lazyQuire');

/**
 * Browser
 */
gulp.task('browser:sync', lazyQuire(require, './gulp/core/recipes/browser-sync'));

/**
 * Fingerprint
 */
gulp.task('fingerprint', lazyQuire(require, './gulp/core/recipes/fingerprint'));

/**
 * Fonts
 */
gulp.task('fonts:clean', lazyQuire(require, './gulp/core/recipes/fonts/clean'));
gulp.task('fonts:dev', gulp.series('fonts:clean', lazyQuire(require, './gulp/core/recipes/fonts/dev')));
gulp.task('fonts:prod', gulp.series('fonts:clean', lazyQuire(require, './gulp/core/recipes/fonts/prod')));
gulp.task('fonts:watch', gulp.series('fonts:dev', lazyQuire(require, './gulp/core/recipes/fonts/watch')));

/**
 * Vendor
 */
gulp.task('vendor:clean', lazyQuire(require, './gulp/core/recipes/vendor/clean'));
gulp.task('vendor:dev', gulp.series('vendor:clean', lazyQuire(require, './gulp/core/recipes/vendor/dev')));
gulp.task('vendor:prod', gulp.series('vendor:clean', lazyQuire(require, './gulp/core/recipes/vendor/prod')));
gulp.task('vendor:watch', gulp.series('vendor:dev', lazyQuire(require, './gulp/core/recipes/vendor/watch')));

/**
 * Video
 */
gulp.task('video:clean', lazyQuire(require, './gulp/core/recipes/video/clean'));
gulp.task('video:dev', gulp.series('video:clean', lazyQuire(require, './gulp/core/recipes/video/dev')));
gulp.task('video:prod', gulp.series('video:clean', lazyQuire(require, './gulp/core/recipes/video/prod')));
gulp.task('video:watch', gulp.series('video:dev', lazyQuire(require, './gulp/core/recipes/video/watch')));


/**
 * Svgs
 */
gulp.task('svg:clean', lazyQuire(require, './gulp/core/recipes/svg/clean'));
gulp.task('svg:dev', gulp.series('svg:clean', lazyQuire(require, './gulp/core/recipes/svg/dev')));
gulp.task('svg:prod', gulp.series('svg:clean', lazyQuire(require, './gulp/core/recipes/svg/prod')));
gulp.task('svg:watch', gulp.series('svg:dev', lazyQuire(require, './gulp/core/recipes/svg/watch')));


/**
 * Svg Sprites
 */
gulp.task('sprite:clean', lazyQuire(require, './gulp/core/recipes/sprite/clean'));
gulp.task('sprite:dev', gulp.series('sprite:clean', lazyQuire(require, './gulp/core/recipes/sprite/dev')));
gulp.task('sprite:prod', gulp.series('sprite:clean', lazyQuire(require, './gulp/core/recipes/sprite/prod')));
gulp.task('sprite:watch', gulp.series('sprite:dev', lazyQuire(require, './gulp/core/recipes/sprite/watch')));


/**
 * Images
 */
gulp.task('images:clean', lazyQuire(require, './gulp/core/recipes/images/clean'));
gulp.task('images:dev', gulp.series('images:clean', lazyQuire(require, './gulp/core/recipes/images/dev')));
gulp.task('images:prod', gulp.series('images:clean', lazyQuire(require, './gulp/core/recipes/images/prod')));
gulp.task('images:watch', gulp.series('images:dev', lazyQuire(require, './gulp/core/recipes/images/watch')));


/**
 * Scripts
 */
gulp.task('scripts:clean', lazyQuire(require, './gulp/core/recipes/scripts/clean'));
gulp.task('scripts:dev', gulp.series('scripts:clean', lazyQuire(require, './gulp/core/recipes/scripts/dev')));
gulp.task('scripts:prod', gulp.series('scripts:clean', lazyQuire(require, './gulp/core/recipes/scripts/prod')));
gulp.task('scripts:watch', gulp.series('scripts:dev', lazyQuire(require, './gulp/core/recipes/scripts/watch')));
gulp.task('scripts:prod-compiled', gulp.series('scripts:clean', lazyQuire(require, './gulp/core/recipes/scripts/prod-compiled')));

/**
 * Styles
 */
gulp.task('styles:clean', lazyQuire(require, './gulp/core/recipes/styles/clean'));
gulp.task('styles:dev', gulp.series('styles:clean', lazyQuire(require, './gulp/core/recipes/styles/dev')));
gulp.task('styles:prod', gulp.series('styles:clean', lazyQuire(require, './gulp/core/recipes/styles/prod')));
gulp.task('styles:watch', gulp.series('styles:dev', lazyQuire(require, './gulp/core/recipes/styles/watch')));

/**
 * Grouped
 */
gulp.task('default', gulp.parallel(
	'fingerprint',
	'fonts:watch',
	'vendor:watch',
	'video:watch',
	'svg:watch',
	'sprite:watch',
	'images:watch',
	'scripts:watch',
	'styles:watch',
	'browser:sync',
)
);

gulp.task('build', gulp.parallel(
  'fingerprint',
	'fonts:prod',
	'vendor:prod',
	'video:prod',
	'svg:prod',
	'sprite:prod',
	'images:prod',
	'scripts:prod',
	'styles:prod'
)
);

gulp.task('build-compiled', gulp.parallel(
  'fingerprint',
	'fonts:prod',
	'vendor:prod',
	'video:prod',
	'svg:prod',
	'sprite:prod',
	'images:prod',
	'scripts:prod-compiled',
	'styles:prod'
)
);
