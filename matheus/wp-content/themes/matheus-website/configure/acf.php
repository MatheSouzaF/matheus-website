<?php

// ACF functions here

setup_options_page();

function setup_options_page()
{

    if (function_exists('acf_add_options_page')) {

        $option_page = acf_add_options_page(array(
            'page_title'     => 'Configurações Gerais',
            'menu_title'     => 'Configurações Gerais',
            'menu_slug'     => 'configuracoes-gerais',
            'capability'     => 'edit_posts',
            'redirect'     => false
        ));

        $menu_page = acf_add_options_page(array(
            'page_title'  => __('Menu'),
            'menu_title'  => 'Menu',
            'menu_slug'  => 'Menu',
            'parent_slug' => 'configuracoes-gerais',
        ));
        $footer_page = acf_add_options_page(array(
            'page_title'  => __('Footer'),
            'menu_title'  => 'Footer',
            'menu_slug'  => 'Footer',
            'parent_slug' => 'configuracoes-gerais',
        ));
        
    }
}
