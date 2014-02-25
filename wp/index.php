<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * wp-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
define('WP_USE_THEMES', true);
/**
 * Using this to only define the path to WP once. Using it in wp-config.php as
 * well when defining 'WP_SITEURL'.
 */
require_once( dirname( __FILE__ ) . '/config.php' );

/** Loads the WordPress Environment and Template */
require( dirname( __FILE__ ) . '/' . MY_WP_PATH . '/wp-blog-header.php' );
