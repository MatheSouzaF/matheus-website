import {initDynamicModules} from './dynamic-modules.js';

$(document).ready(() => {
  initDynamicModules();
});
$(window).on('load', () => {
  initDynamicModules();
});
