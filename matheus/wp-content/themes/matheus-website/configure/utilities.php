<?php

function get_ri_file_extension($cpt)
{
  $extension = '';
  $arquivo = get_field('arquivo', $cpt->ID);
  $url = $arquivo ? $arquivo['url'] : get_field('link_externo', $cpt->ID);

  if (preg_match('(youtube|youtu.be)', $url) === 1) {
    $extension = 'youtube';
  } else if ($url) {
    $extension = pathinfo($url, PATHINFO_EXTENSION);
  }

  return strtoupper($extension);
}

function get_ri_file_link($cpt)
{
  $arquivo = get_field('arquivo', $cpt->ID);
  return $arquivo ? $arquivo['url'] : get_field('link_externo', $cpt->ID);
}

function get_ri_cpt_year_options($cpt_name_array = []): array
{
  global $wpdb;
  $options = [];

  if (!is_array($cpt_name_array)) {
    $cpt_name_array = [$cpt_name_array];
  }

  // Unir string em formato `item','item','item`
  $cpt_name_list = array_reduce($cpt_name_array, function ($carry, $item) {
    return $carry . $item . "','";
  }, '');
  $cpt_name_list = rtrim($cpt_name_list, "','");

  $query = "SELECT DISTINCT anos as meta_value from (SELECT left(meta_value, 4) as anos FROM `wp_postmeta`
   JOIN wp_posts ON wp_postmeta.post_id = wp_posts.ID
    WHERE meta_key = 'data' AND post_type IN ('$cpt_name_list')
    ORDER BY meta_value DESC) anos ORDER BY anos DESC;";

  $anos = $wpdb->get_results(sanitize_text_field($query));
  foreach ($anos as $ano) {
    if ($ano->meta_value) {
      $options[] = $ano->meta_value;
    }
  }
  return $options;
}

function generate_years_options()
{
  $year = date('Y');
  $options = [];
  for ($year; $year > 2018; $year--) {
    $options[] = $year;
  }
  return $options;
}

function generate_years_filter()
{
  $year = $first = date('Y');
  $options = [];
  for ($year; $year > $first - 11; $year--) {
    if ($year === $first) {
      $options[$year] = true;
    } else {
      $options[$year] = false;
    }
  }
  return $options;
}

function latinizeString($texto)
{
  $aa = str_replace(
    array('à', 'á', 'â', 'ã', 'ä', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ', 'À', 'Á', 'Â', 'Ã', 'Ä', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ù', 'Ú', 'Û', 'Ü', 'Ý'),
    array('a', 'a', 'a', 'a', 'a', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'n', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y', 'A', 'A', 'A', 'A', 'A', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'N', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y'),
    $texto
  );

  return $aa;
}

function urllatinizeString($texto)
{
  $aa = str_replace(
    array(' ', 'à', 'á', 'â', 'ã', 'ä', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ', 'À', 'Á', 'Â', 'Ã', 'Ä', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ù', 'Ú', 'Û', 'Ü', 'Ý'),
    array('-', 'a', 'a', 'a', 'a', 'a', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'n', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y', 'A', 'A', 'A', 'A', 'A', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'N', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y'),
    $texto
  );

  $bb = preg_replace('/[^A-Za-z0-9\-]/', '', $aa);

  return $bb;
}

/**
 * Escreve o permalink correto a partir do idioma ativo
 * Considera o fragmento #anchor e ?query da url
 *
 * @param string       $page_path Page path.
 * @param string       $post_type Optional. Post type. Default 'page'.
 * @return null
 */
function the_page_link($page_path = null, $post_type = 'page')
{
  if (is_null($page_path)) {
    echo '';
  }

  $parsed_url = parse_url($page_path);

  if ($parsed_url === false) {
    echo $page_path;
  }

  $page_obj = get_page_by_path($parsed_url['path'], OBJECT, $post_type);


  $permalink = '';

  if ($page_path == '/imprensa/press-releases/') {  // não é vinculado single com esta função
    echo get_post_type_archive_link('imprensa');

  } else if ($page_path == '/inovacao-engie/projetos/') { // não tem single
    echo get_post_type_archive_link('projetos');

  } else if (str_contains($page_path, '/duvidas-frequentes/')) {  // vincula single de investidores
    $url_parts = explode('/duvidas-frequentes/', $page_path);

    $suffix = $url_parts[1] ?? '';

    echo get_post_type_archive_link('duvida_frequente') . $suffix;

  } else if (is_null($page_obj)) {
    echo $page_path;

  } else {
    $permalink = get_permalink($page_obj);

    echo $permalink . (isset($parsed_url['fragment']) ? '#' . $parsed_url['fragment'] : '') . (isset($parsed_url['query']) ? '?' . $parsed_url['query'] : '');
  }

}

/**
 * Retorna o código do idioma ativo
 *
 * @return string Código do idioma PT-BR ou EN-US
 */
function getCurrentLanguage()
{
  return apply_filters('wpml_current_language', null);
}

function localizedNumber($number, $decimal_number = 0)
{
  $current_language = getCurrentLanguage();

  if ($current_language === 'en') {
    return number_format((float) $number, $decimal_number, '.', ',');
  }

  return number_format((float) $number, $decimal_number, ',', '.');
}