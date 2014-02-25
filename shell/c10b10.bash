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
alias mvim="$C10_DOTFILES/vim/mvim"

alias cdproj="cd ~/Projects"
alias cdw3="cd ~/Projects/w3"


# =Tools

# ==Server

alias nginx.start='sudo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'

# ==WordPress General
alias cdp="pushd wp-content/plugins"
alias cdt="pushd wp-content/themes"

# ==Wordpress Code Sniffer
alias wpcs="phpcs -psv --standard=WordPress --extensions=pdhp"
alias cdwpcs="pushd ~/Projects/PHP/WordPress-Coding-Standards"
alias wpcsdeploy="pushd ~/Projects/PHP/ && ./deploy-wp-coding-standards.sh && popd"

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

# ==ATF
alias v.doctool.pip=~/.virtualenvs/doctool/bin/pip

# ==KCL
alias kclgl='git checkout wp-content/themes/thekrazycouponlady_v2/assets/css/style.css; git checkout wp-content/themes/thekrazycouponlady_v2/assets/css/tvslider.css; git pull'
alias kclgco='git checkout wp-content/themes/thekrazycouponlady_v2/assets/css/style.css; git checkout wp-content/themes/thekrazycouponlady_v2/assets/css/tvslider.css; git checkout'

# =Mashable
alias mbcd="cd /Users/c10b10/Projects/w3/mashable/"
alias mbcdw="mbcd && cd wordpress"
alias mbcdp="mbcd && cd wordpress && cdp"
alias mbcdt="mbcd && cd wordpress && cdt"
alias mbcn="git config --local user.name \"Frederick Townes\""
alias mbce="git config --local user.email \"frederick@mashable.com\""
alias asfred="mbcn && mbce"
alias mbcgu="git config --local github.user ftownes"
alias mbcgt="git config --local github.token b8404f14b494442a98464ec864eb0b53"
# alias mbbk="mbcd && mkdir test && mv test [$(NC)]" # TODO
alias mbsabin="rm -rf _sabin_dropbox && mbcd && cp -rf /Users/c10b10/Dropbox/_ppl/sabin/mshbl sabin_dropbox"
alias mbclone="mbcd && git clone git@github.com:mashable/mashable.git wordpress && mbcdw && git checkout staging"
alias mbsetup="mbcd && cp _reusables/wp-config.php wordpress/wp-config.php && cp _sabin_dropbox/wp-content/themes/v7/css/config.rb wordpress/wp-content/themes/v7/css/config.rb && mbcdw & mbcn && mbce && mbcgu && mbcgt"
alias gfred="mbcn && mbce && mbcgu && mbcgt"
alias gid="cat ~/.ssh/config"
