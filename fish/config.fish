function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

# Add path to my dotfiles
# DO NOT ADD A TRAILING SLASH!
set -gx C10_DOTFILES (dirname (dirname (realpath (status -f))))

set -gx LC_ALL UTF-8
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

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# # Fix SaltStack UTF-8 issue
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

set -gx PAGER 'less'
set -gx LESS '-R'

# Set PATH
set -gx PATH "/sbin"

__prepend_to_path "/usr/sbin"
__prepend_to_path "/bin"
__prepend_to_path "/usr/bin"
__prepend_to_path "/usr/local/bin"
__prepend_to_path "/usr/local/sbin"

# Homebrew
__prepend_to_path "/opt/homebrew/bin"


# NVM
if nvm >/dev/null 2>&1
    __prepend_to_path $NVM_BIN
    # nvm use default --silent
end

# Python
if python -c "import virtualfish" >/dev/null 2>&1
    eval (python -m virtualfish)
    set -xg WORKON_HOME $HOME/.virtualenvs
end

# # Node
# if command -v node >/dev/null 2>&1
#     set -xg NPM_PACKAGES (npm config get prefix)
#     set -e MANPATH
#     set mp (manpath)
#     set -xg MANPATH "$NPM_PACKAGES/share/man:$mp"
#     set -xg NODE_PATH "$NPM_PACKAGES/lib/node_modules"
#     __prepend_to_path $NPM_PACKAGES/bin
#     __prepend_to_path './node_modules/.bin'
# end

__prepend_to_path "$C10_DOTFILES/bin"

# Golang
set -gx GO111MODULE on
set -gx GOPRIVATE "gitlab.com/airportlabs"

# Mongo
# __prepend_to_path "/usr/local/opt/mongodb-community@4.2/bin"

__prepend_to_path "/usr/local/go/bin"
__prepend_to_path (go env GOPATH)"/bin"

. $C10_DOTFILES/fish/extras/aliases.fish

thefuck --alias | source
starship init fish | source

# Autocmplete `g` as you would `git`
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
