<?php

// Ajustando
define('SEARCH_RESULTS_POSTS_PER_PAGE', 10);

add_action('pre_get_posts', function ($query) {
  if (!is_admin() && $query->is_main_query()) {
    if ($query->is_search) {
      $query->set('paged', (get_query_var('paged')) ? get_query_var('paged') : 1);
      $query->set('posts_per_page', SEARCH_RESULTS_POSTS_PER_PAGE);
    }
  }
});
