<?php

function mff_plugin_url( $path = '' ) {
	$url = plugins_url( $path, MFF_PLUGIN );

	if ( is_ssl() && 'http:' == substr( $url, 0, 5 ) ) {
		$url = 'https:' . substr( $url, 5 );
	}

	return $url;
}

function mff_load_js() {
	return apply_filters( 'mff_load_js', MFF_LOAD_JS );
}
