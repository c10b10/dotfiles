function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

# Add path to my dotfiles
# DO NOT ADD A TRAILING SLASH!
set -gx C10_DOTFILES (dirname (dirname (realpath (status -f))))

set -gx TERM xterm-256color
set -gx TERM_PROGRAM xterm-256color
set -gx TERM_PROGRAM_VERSION xterm-256color
set -gx fish_term256 1
set -e fish_term24bit
# Mac
set -gx CLICOLOR 1
set -gx LSCOLORS gxfxcxdxbxegedabagacad
# Linux
set -gx LS_COLORS "di=1;36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=36;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# Fix SaltStack UTF-8 issue
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

set -gx PAGER 'less'
set -gx LESS '-R'

# Set PATH
set -gx PATH "/sbin"
function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/sbin"

# NVM
if test -e $C10_DOTFILES/fish/functions/bass.fish
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end

    set -xg NVM_DIR $HOME/.nvm
    nvm use default --silent
end
# Python
if python -c "import virtualfish" >/dev/null 2>&1
    eval (python -m virtualfish)
    set -xg WORKON_HOME $HOME/.virtualenvs
end
# Node
if command -v node >/dev/null 2>&1
    set -xg NPM_PACKAGES (npm config get prefix)
    set -e MANPATH
    set mp (manpath)
    set -xg MANPATH "$NPM_PACKAGES/share/man:$mp"
    set -xg NODE_PATH "$NPM_PACKAGES/lib/node_modules"
    prepend_to_path $NPM_PACKAGES/bin
    prepend_to_path './node_modules/.bin'
end

# RVM
if test -e $HOME/.rvm/bin/rvm-prompt
  prepend_to_path "$HOME/.rvm/bin"
  rvm default
end
prepend_to_path "$C10_DOTFILES/bin"

. $C10_DOTFILES/fish/extras/aliases.fish

function make_completion --argument alias command
    complete -c $alias -xa "(
        set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
        complete -C\"$command \$cmd\";
    )"
end

make_completion g "git"

function start_ssh_agent -d "Starts ssh agent if it's not online"
    # Start SSH agent if not started
    if test -z $SSH_AGENT_PID
      set -x SSH_ENV (ssh-agent -c | sed 's/^echo/#echo/')
      eval $SSH_ENV
      chmod 600 $SSH_AUTH_SOCK
    end
    # Add ssh keys if no identities are added
    if ssh-add -l | grep "The agent has no identities" > /dev/null
      ssh-add -K (ls ~/.ssh/id* | grep -v "\.pub") > /dev/null 2>&1
    end
end

start_ssh_agent
