<?php
// Endpoint para retornar os produtos: GET /wp-json/api/produtos?lines_id=1,2,3&segments=industria,linha_branca&applications=interno&materials=pead,psai

add_action('rest_api_init', function () {
    register_rest_route(
        '/api',
        '/produtos',
        [
            'methods' => WP_REST_Server::READABLE,
            'callback' => 'produtos_api_get_data_route_action',
            'validate_callback' => 'produtos_api_get_data_validation',
            'args' => produtos_get_api_get_data_args(),
            'permission_callback' => '',
        ]
    );
});

function produtos_get_api_get_data_args()
{
    $args = [];

    $args['line_id'] = [
        'description' => __('Id da linha do produto', 'mondiana-website'),
        'type' => 'integer',
    ];

    $args['segment'] = [
        'description' => __('Valor ACF do campo segment do produto', 'mondiana-website'),
        'type' => 'string',
    ];

    $args['aplicacao'] = [
        'description' => __('Valor ACF do campo aplicação do produto', 'mondiana-website'),
        'type' => 'string',
    ];

    $args['material'] = [
        'description' => __('Valor ACF do campo material do produto', 'mondiana-website'),
        'type' => 'string',
    ];

    $args['order_by'] = [
        'description' => __('Order pelo campo', 'mondiana-website'),
        'type' => 'string',
        'enum' => ['line_produto', 'segment', 'aplicacao', 'material'],
    ];

    $args['order'] = [
        'description' => __('Ordernas ascendente ou descendente', 'mondiana-website'),
        'type' => 'string',
        'enum' => ['asc', 'desc'],
    ];

    return $args;
}

function produtos_api_get_data_validation()
{
    // Validação dos parametros da consulta
    return [];
}

function produtos_api_get_data_route_action($request)
{
    $products = get_products($request);
    $lines_with_categories = [];

    usort($products, function($a, $b)
    {
        return strcmp($a['product_name'], $b['product_name']);
    });

    foreach ($products as $product) {
        $category = $product['product_category'] ?? 'unknown';
        $lines_with_categories[$product['line_name']]['categories'][$category][] = $product;
        $lines_with_categories[$product['line_name']]['line_url'] = $product['line_url'];
    }

    ksort($lines_with_categories);

    return rest_ensure_response($lines_with_categories);
}

function get_products($request)
{
    $products = (new WP_Query(build_filter($request)))->get_posts();
    $products_return = [];

    foreach ($products as $product) {
        $lines = get_the_terms($product, 'linha');

        if ($lines && sizeof($lines) > 0 && get_field('enabled', $lines[0])) {
            $line_return = [
                'line_id' => $lines[0]->term_id,
                'line_name' => $lines[0]->name,
                'line_slug' => $lines[0]->slug,
                'line_description' => $lines[0]->description,
                'line_url' => get_term_link($lines[0], 'line_produto'),
            ];
        } else {
            continue;
        }

        $products_return[] = array_merge([
            'product_name' => get_field('nome_do_produto', $product->ID),
            'product_category' => get_field('categoria', $product->ID),
            'product_url' => get_permalink($product->ID),
        ], $line_return);
    }

    return $products_return;
}

function build_filter($request)
{
    $params = $request->get_params();
    $lines_id = isset($params['lines_id']) ? sanitize_text_field($params['lines_id']) : null;
    $segments = isset($params['segments']) ? sanitize_text_field($params['segments']) : null;
    $applications = isset($params['applications']) ? sanitize_text_field($params['applications']) : null;
    $materials = isset($params['materials']) ? sanitize_text_field($params['materials']) : null;

    $meta_query = [];

    $filtro = [
        'posts_per_page' => -1,
        'post_type' => 'produto',
        'relation' => 'OR'
    ];

    if ($lines_id) {
        $filtro['tax_query']['relation'] = 'OR';
        foreach (explode(',', $lines_id) as $line_id) {
            $filtro['tax_query'][] = [
                'taxonomy' => 'linha',
                'field' => 'term_id',
                'terms' => $line_id,
            ];
        }
    }

    if ($segments) {
        $meta_query = array_merge($meta_query, build_meta_query_for($segments, 'segments'));
    }

    if ($applications) {
        $meta_query = array_merge($meta_query, build_meta_query_for($applications, 'applications'));
    }

    if ($materials) {
        $meta_query = array_merge($meta_query, build_meta_query_for($materials, 'materials'));
    }

    if (!empty($meta_query)) {
        $meta_query['relation'] = 'OR';
        $filtro['meta_query'] = $meta_query;
    }

    return $filtro;
}
function build_meta_query_for($values, $key)
{
    $values = explode(',', $values);
    foreach ($values as $value) {
        $meta_query[] = array(
            'key' => $key,
            'value' => $value,
            'type' => 'CHAR',
            'compare' => 'LIKE'
        );
    }

    return $meta_query;
}