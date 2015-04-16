<?php
/**
 * Lets change the location of the wp-contents dir.
 *
 * Using config.php to only define the path to WP once.
 * Using it in index.php as well.
 */
require_once( dirname( __FILE__ ) . '/config.php' );

define('WP_CONTENT_DIR', dirname( __FILE__ ) . '/' . MY_WP_CONTENT );
define('WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/' . MY_WP_CONTENT );
define('WP_SITEURL', 'http://' . $_SERVER['SERVER_NAME'] . '/' . MY_WP_PATH);
define('WP_HOME',    'http://' . $_SERVER['SERVER_NAME']);
define('DOING_ACCEPTANCE_TESTS', true );

/**
 * Include the wp-deploy-flow settings.
 */
/* include( dirname( __FILE__ ) . '/deploy.php' ); */

/**
 * Database settings
 */

$table_prefix = 'wp_';

$host = $_SERVER['HTTP_HOST'];
/** The name of the database for WordPress */
if ( ( strpos( $host, 'example.com' ) !== false ) || ( PHP_SAPI == 'cli' ) ) {
	define( 'DB_NAME', 'example' );
	define( 'UPLOADS', 'media/uploads_example' );
} else {
	define( 'DB_NAME', 'other' );
	define( 'UPLOADS', 'media/uploads' );
}

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'DISABLE_WP_CRON', true );

/**
 * Debugging
 */
if ( PHP_SAPI != 'cli' ) {
	define( 'WP_DEBUG', true );
	define( 'WP_DEBUG_LOG', false );
	define( 'WP_DEBUG_DISPLAY', true );
}

/**
 * If ( current_user_can('install_plugins')) {
 * 	global $wpdb;
 * 	print_r($wpdb->queries);
 * }
 */
define('SAVEQUERIES', true);

/**
 * To enable logging, first you need to create a php_error.log file and upload
 * it to your root WordPress directory. Then simply turn on the log_errors PHP
 * option and point to your logging file:
*/
/* @ini_set( 'log_errors','On' ); */
/* @ini_set( 'display_errors','Off' ); */
/* @ini_set( 'error_log','php_error.log' ); */


/**
 * WP_SITEURL option allows you to temporarily change the WordPress site URL.
 * This does not alter the database option value for siteurl, but instead
 * temporarily changes the value.
 * WP_HOME works exactly the same, only it refers to the home value.
 */
/* define('WP_SITEURL', 'http://example.com/wp'); */
/* define('WP_HOME', 'http://example.com/wordpress'); */

/**
 * Optionally you can set the path to your plugins directory like so.
 */
/* define( 'WP_PLUGIN_DIR', $_SERVER['DOCUMENT_ROOT'] . '/blog/wp-content/plugins' ); */
/* define( 'WP_PLUGIN_URL', 'http://example/blog/wp-content/plugins'); */

/**
 * Set options for the post/page revisions.
 */
/* define('WP_POST_REVISIONS', false ); */
/* define( 'WP_POST_REVISIONS', 2 ); */

/**
 * Set the auto save interval.
 */
/* define('AUTOSAVE_INTERVAL', 300 ); */


/** Change memory limit */
/* define('WP_MEMORY_LIMIT', '32M'); */

/** Override default file permissions */
/* define('FS_CHMOD_FILE',0644); */
/* define('FS_CHMOD_DIR',0755); */

/** View all constants currently set on the WP installation.  */
/* print_r(@get_defined_constants()); */


/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
/* define( 'AUTH_KEY',         'put your unique phrase here' ); */
/* define( 'SECURE_AUTH_KEY',  'put your unique phrase here' ); */
/* define( 'LOGGED_IN_KEY',    'put your unique phrase here' ); */
/* define( 'NONCE_KEY',        'put your unique phrase here' ); */
/* define( 'AUTH_SALT',        'put your unique phrase here' ); */
/* define( 'SECURE_AUTH_SALT', 'put your unique phrase here' ); */
/* define( 'LOGGED_IN_SALT',   'put your unique phrase here' ); */
/* define( 'NONCE_SALT',       'put your unique phrase here' ); */

/**#@-*/

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress.  A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de.mo to wp-content/languages and set WPLANG to 'de' to enable German
 * language support.
 */
define( 'WPLANG', '' );
define( 'PORT_DEV', true );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/sys' );

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
