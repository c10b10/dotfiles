#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

check_if_homebrew_installed

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
  nvim
  go@1.17
  n
)

for plugin in $plugins; do
  echo_color "Installing \"${plugin}\"..." _ 13
  brew install ${plugin}
done

plugins_string="${plugins[@]}"
echo_color "✔ Install complete for \"${plugins_string}\"." _ green

echo_color "Installing Iosevka Nerd Font..." _ 13
brew tap homebrew/cask-fonts && brew install --cask font-iosevka-nerd-font
echo_color "✔ Ioseva Nerd Font is now installed." _ green

context=${1}
if [ "$context" != 'installer' ]; then
  royal_fin
fi

unset HOMEBREW_NO_AUTO_UPDATE
