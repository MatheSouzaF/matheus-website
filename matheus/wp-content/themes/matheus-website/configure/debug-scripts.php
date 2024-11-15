<?php

add_action('wp_enqueue_scripts', function () {
  wp_localize_script('main', 'debug_scripts', [
    'debug' => WP_DEBUG
  ]);
}, 110);