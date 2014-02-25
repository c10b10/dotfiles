<?php

/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

/* $'true'host = $_SERVER['HTTP_HOST']; /1* Get current domain *1/ */

/**
 * Using this to only define the path to WP once. Using it in index.php as
 * well.
 */
require_once( dirname( __FILE__ ) . '/config.php' );

define('WP_CONTENT_DIR', dirname( __FILE__ ) . '/content' );
define('WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/content' );
define('WP_SITEURL', 'http://' . $_SERVER['SERVER_NAME'] . '/' . MY_WP_PATH);
define('WP_HOME',    'http://' . $_SERVER['SERVER_NAME']);

# For wp-deploy-path

define( 'DEV_URL', 'the-site-url.com' );
define( 'DEV_PATH', '/the/path/to/the/site/on/the/server' ); /** Not used. Server url to  */

define( 'DEV_SSH_HOST', 'a.ssh.host.goes.here' );
define( 'DEV_SSH_USER', 'user' );
define( 'DEV_SSH_PATH', '/home/user/wp_deploy' ); /** Not used. Server url to  */
/** TODO Pull needs /uploads and push does not, so fix this! */
define( 'DEV_UPLOADS_PATH', '/home/user/shared/uploads' );

define( 'DEV_DB_HOST', 'a.db.host.goes.here' );
define( 'DEV_DB_NAME', 'the_db_name' );
define( 'DEV_DB_USER', 'root' );
define( 'DEV_DB_PASSWORD', 'root' );


/* if ( $host == 'bla.local' ) { */
/* 	/** The name of the database for WordPress *1/ */
/* 	define( 'DB_NAME', 'db' ); */
/* 	$table_prefix = 'wp_'; */
/* } else { */
/* 	define( 'DB_NAME', 'w3_site_migration' ); */
$table_prefix = 'wp_';
/* } */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'c10_site' );

/** MySQL database username */
define( 'DB_USER', 'root' );
// define('DB_USER', 'dorex_w3');

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );
// define('DB_PASSWORD', 'asdasd');

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** WP_SITEURL option allows you to temporarily change the WordPress site URL.
	This does not alter the database option value for siteurl, but instead temporarily changes the value.
	WP_HOME works exactly the same, only it refers to the home value.

define('WP_SITEURL', 'http://example.com/wp');
define('WP_HOME', 'http://example.com/wordpress');

*/

/** The following options allow you to move the wp-content directory.
	WP_CONTENT_DIR is the full local path to your wp-content directory.
	WP_CONTENT_URL is the full URI of this directory

	@since 2.6.0

define( 'WP_CONTENT_DIR', $_SERVER['DOCUMENT_ROOT'] . '/wordpress/blog/wp-content' );
define( 'WP_CONTENT_URL', 'http://domain.com/wordpress/blog/wp-content');

*/

/**	Optionally you can set the path to your plugins
	directory like so.

define( 'WP_PLUGIN_DIR', $_SERVER['DOCUMENT_ROOT'] . '/blog/wp-content/plugins' );
define( 'WP_PLUGIN_URL', 'http://example/blog/wp-content/plugins');

*/

# Set options for the post/page revisions.

//define('WP_POST_REVISIONS', false );
define( 'WP_POST_REVISIONS', 2 );

define( 'WPCF7_LOAD_CSS', false );

/** Set the auto save interval.

define('AUTOSAVE_INTERVAL', 300 );

*/

/**------- #Debugging options ------*/

/** Activate the Wordpress debug */

define( 'WP_DEBUG', true ); // turn on debug mode
define( 'WP_DEBUG_LOG', false ); // log to wp-content/debug.log
# Display php errors
define( 'WP_DEBUG_DISPLAY', true ); // don't force display_errors to on

/** Activating this option saves all database queries into a
	global array that can be displayed on your page.

	To display the query array in your theme, add the following code to any theme template file to view:
	If ( current_user_can('install_plugins')) {
	global $wpdb;
	print_r($wpdb->queries);
	}
d
define('SAVEQUERIES', true);

-*/

/** To enable logging, first you need to create a php_error.log file and upload it to your root WordPress directory.
	Then simply turn on the log_errors PHP option and point to your logging file:
-*/
@ini_set( 'log_errors','On' );
@ini_set( 'display_errors','Off' );
@ini_set( 'error_log','php_error.log' );

/** Change memory limit

define('WP_MEMORY_LIMIT', '32M');

-*/

/* Language options page 55 */

/** FTP information


define('FTP_BASE', '/../../../Volumes/MacData/Projects/www/wp3/');
define('FTP_CONTENT_DIR', '/../../../Volumes/MacData/Projects/www/wp3/wp-content/');
define('FTP_PLUGIN_DIR ', '/../../../Volumes/MacData/Projects/www/wp3/wp-content/plugins/');
define('FTP_USER', 'MACIOBI');
define('FTP_PASS', 'open0mac');
define('FTP_HOST', '192.168.0.103:21');
*/

/** Override default file permissions

define('FS_CHMOD_FILE',0644);
define('FS_CHMOD_DIR',0755);

*/

/** Activate Wordpress Caching


*/

/** View all constants currently set on the WP installation.

print_r(@get_defined_constants());

*/


/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

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

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/wordpress' );
// realpath('./../../d');
/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
