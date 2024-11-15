<?php
/*
 * Plugin Name: Masks Form Fields
 * Version: 1.11.1
 * Plugin URI: https://ivanpetermann.com/masks-form-fields/
 * Description: A plugin to add masks in the form’s fields.
 * Author: Ivan Petermann
 * Author URI: https://ivanpetermann.com
 * Requires at least: 4.5
 * Tested up to: 6.5
 *
 * Text Domain: masks-form-fields
 * Domain Path: /languages/
 *
 * @package WordPress
 * @author Ivan Petermann
 * @since 1.0.0
 */	

/*
	Copyright 2021 Ivan Petermann  (email : contato@ivanpetermann.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/


if ( ! defined( 'ABSPATH' ) ) exit;

define( 'MFF_VERSION', '1.11.1' );
define( 'MFF_PLUGIN', __FILE__ );
define( 'MFF_PLUGIN_DIR', untrailingslashit( dirname( MFF_PLUGIN ) ) );
if ( ! defined( 'MFF_LOAD_JS' ) ) {
	define( 'MFF_LOAD_JS', true );
}

require_once MFF_PLUGIN_DIR . '/includes/functions.php';

function mff_load_textdomain() {
	load_plugin_textdomain( 'masks-form-fields', false, dirname( plugin_basename( __FILE__ ) ) . '/languages/' );
}
add_action( 'init', 'mff_load_textdomain' );

add_action( 'wp_enqueue_scripts', 'mff_do_enqueue_scripts' );

function mff_do_enqueue_scripts() {
	if ( mff_load_js() ) {
		mff_enqueue_scripts();
	}
}

function mff_enqueue_scripts() {
	wp_deregister_script( 'jquery-mask-form' );
	wp_register_script( 'jquery-mask-form',
		mff_plugin_url( 'includes/js/jquery.mask.min.js' ),
		array( 'jquery' ), 'v1.14.16', true );

	$in_footer = true;

	if ( 'header' === mff_load_js() ) {
		$in_footer = false;
	}

	wp_enqueue_script( 'masks-form-fields',
		mff_plugin_url( 'includes/js/scripts.js' ),
		array( 'jquery', 'jquery-mask-form' ), MFF_VERSION, $in_footer );

	$_mff = ['loader' => true];

	wp_add_inline_script( 'masks-form-fields', 'var _mff='.json_encode($_mff).';', 'before' );

	do_action( 'mff_enqueue_scripts' );
}
