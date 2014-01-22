This folder cointains scripts which are available from the terminal.

* `apache-conf-path`: Displays the path to the config file used by apache.
* `apache-deploy-conf`: Deploys the `%DOTFILES%/apache/httpd.conf` file to the
  correct location and restarts the apache server.
* `apache-vhosts-path`: Displays the path to the vhosts file as
  included by our `%DOTFILES%/apache/httpd.conf` file.
* `c10-fix-subtitle`: Utility script to replace broken characters
  in a subtitle file.
* `c10-make-bin-executable`: Makes alls scripts in `%DOTFILES%/bin`
  executable.
* `c10-relink-dotfiles`: This repo cointains config files for various
  services. Those config files lie in the home directory. This scripts
  links the config files and folders from this repo to their correct
  location.
* `git-remove-submodule`: Utility script that allows one to remove
  a submodule from a git repo.
* `mysql-deploy-conf`: Links the `%DOTFILES%/mysql/my.cnf` file to the
  location recognized by mysql.
* `mysql-get-conf-path`: Shows the mysql config file path. Currently,
  `%DOTFILES%/mysql/my.cnf` should symlinked to that location.
* `mysql-uninstall-osx`: Uninstalls mysql which was previously installed
  using the setup mysql script.
* `osx-add-dock-space`: Adds a space in the dock.
* `osx-setup`: Contains number osx configurations.
* `php-switch-osx`: Switches between homebrew php versions and links
  the correct `php.ini` file from `%DOTFILES%/php`. Note that the apache
  config file (`%DOTFILES%/apache/httpd.conf`) links to
  `%DOTFILES%/php/php.ini` which is linked with this script.
* `vim-ycm-compile`: Compiles the vim YouCompleteMe plugin.
* `wp-active-plugins`: Shows a list of active plugins in the current wp
  installation using wp-cli.

