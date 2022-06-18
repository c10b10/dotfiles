#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

symlinks=(
  'ackrc'
  'agignore'
  'gitignore'
  'gitconfig'
)

echo_color "Linking cli tools config files..." _ 13
# Create symlinks for the config files
echo_color "Initializing .dotfiles submodules..." _ yellow
pushd $dotpath &>/dev/null
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
echo_color "⚠️ If you aren't Alex Ciobica you will want to replace the user information in \"~/.gitconfig\"." _ yellow

context=${1}
if [ "$context" != 'installer' ]; then
  royal_fin
fi
