#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

# Install Homebrew
if `brew list >/dev/null 2>&1`
then
  echo_color 'Homebrew is already installed. Skipping install.' _ yellow
else
  echo_color 'Installing Homebrew...' _ 13
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo_color "Updating brew..." _ 13
brew update

context=${1}
if [ "$context"  != 'installer' ]; then
  royal_fin
fi