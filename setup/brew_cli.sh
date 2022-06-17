#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

export HOMEBREW_NO_AUTO_UPDATE=1

plugins=(
  ack
  cmake
  git
  grpcurl
  htop
  openssl
  pstree
  rsync
  the_silver_searcher
  tree
  wget
  yarn
)

if `ls -l $HOME/.nvm >/dev/null 2>&1`
then
  echo_color '"nvm" already installed. Skipping install.' _ yellow
else
  echo_color 'Installing "nvm"...'
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
fi

for plugin in $plugins; do
  echo_color "Installing \"${plugin}\"..." _ 13
  brew install ${plugin}
done

symlinks=(
    'ackrc'
    'agignore'
    'vimrc'
    'vim'
    'npmrc'
    'gitignore'
    'gitconfig'
)

plugins_string="${plugins[@]}"
echo_color "✔ Install complete for \"${plugins_string}\"." _ green

echo_color "Linking cli tools config files..." _ 13

# Create symlinks for the config files
echo_color "Initializing .dotfiles submodules..." _ yellow
pushd $dotpath &> /dev/null
git submodule update --init --recursive
popd

for file in "${symlinks[@]}"; do
    # http://stackoverflow.com/questions/9532654/bash-expression-after-last-specific-character
    if [ ! -f $dotpath/$file ] && [ ! -d $dotpath/$file ]; then
      echo_color "Failed linking $dotpath/$file to $HOME/.${file##*/}" _ red
    else
      rm -rf $HOME/.$file
      echo_color "Linked $dotpath/$file to $HOME/.${file##*/}" _ green
      ln -fs $dotpath/$file $HOME/.${file##*/}
    fi
done
echo_color "✔ Config files have been linked." _ green
echo_color "✔ You might want to replace the user information in ~/.gitconfig." _ yellow

context=${1}
if [ "$context"  != 'installer' ]; then
  royal_fin
fi

unset HOMEBREW_NO_AUTO_UPDATE
