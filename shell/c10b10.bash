#!/bin/bash

# This file contains different aliases

# =General-

alias cd..="cd ../.."
alias cd...="cd ../../.."
alias lss="ls -laGh"
alias svim="mvim -S"
alias mkctags="ctags -R --languages=php ."
alias dsw="find . -name '*.sw*' \( ! -name '*.swf' \) -delete"

# ==Expand links to their full location
cdh() { cd $1; cd `pwd -P`; }

alias editalias="vim $C10_DOTFILES/shell/c10b10.bash && reload"
# alias mvim="$C10_DOTFILES/vim/mvim"

alias cdproj="cd ~/Projects"

# =Tools

# ==Server

alias nginx.start='sudo launchctl load /usr/local/opt/nginx/homebrew.mxcl.nginx.plist && echo "nginx started."'
alias nginx.stop='sudo launchctl unload /usr/local/opt/nginx/homebrew.mxcl.nginx.plist && echo "nginx stopped."'
alias nginx.reload='sudo nginx -s reload && echo "nginx config reloaded."'
alias nginx.restart='nginx.stop && nginx.start'
alias php-fpm.start="sudo launchctl load -w $C10_DOTFILES/php/homebrew.mxcl.php.plist && echo \"php-fpm started.\""
alias php-fpm.stop="sudo launchctl unload -w $C10_DOTFILES/php/homebrew.mxcl.php.plist && echo \"php-fpm stopped.\""
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias nuke.em='nginx.stop && php-fpm.stop && mysql.server stop && nginx.start && php-fpm.start && mysql.server start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias memcached.start='launchctl load -w /usr/local/opt/memcached/homebrew.mxcl.memcached.plist && echo "memcached started. Use telnet localhost 11211 to connect to the memcached server."'
alias memcached.stop='launchctl unload -w /usr/local/opt/memcached/homebrew.mxcl.memcached.plist && echo "memcached stopped."'

# ==WordPress General
alias cdp="pushd wp-content/plugins"
alias cdt="pushd wp-content/themes"

# ==Vim
alias unlockvim="pushd ~/.vim/sessions/ && rm -rf *.lock && popd"

# ==python - http://paste.pocoo.org/show/164838/
alias v=workon
alias v.deactivate=deactivate
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm=rmvirtualenv
alias v.switch=workon
alias v.add2virtualenv=add2virtualenv
alias v.cdsitepackages=cdsitepackages
alias v.cd=cdvirtualenv
alias v.lssitepackages=lssitepackages

# ==apache
alias apache.file='apachectl -V | grep "httpd.conf"'
alias apache.config='sudo vim /private/etc/apache2/httpd.conf'
alias apache.vhosts='sudo vim /private/etc/apache2/extra/httpd-vhosts.conf'

# =Projects

# ==Wordpress Code Sniffer
alias wpcs="phpcs -psv --standard=WordPress --extensions=pdhp"
alias cdwpcs="pushd ~/Projects/PHP/WordPress-Coding-Standards"
alias wpcsdeploy="pushd ~/Projects/PHP/ && ./deploy-wp-coding-standards.sh && popd"

