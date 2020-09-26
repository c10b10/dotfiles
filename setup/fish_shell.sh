#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

export HOMEBREW_NO_AUTO_UPDATE=1

echo_color "Installing fish..." _ 13
brew install fish

echo_color "Linking \"$dotpath/fish\" to \"$HOME/.config/fish\"..."
ln -fs $dotpath/fish $HOME/.config/fish

echo_color 'Installing "ohmyfish (omf)"...' _ 13
curl -L https://get.oh-my.fish | fish
echo_color 'Installing omf "git" plugin...' _ 13
fish -c "omf install https://github.com/jhillyerd/plugin-git"
echo_color 'Installing omf "bass" plugin...' _ 13
fish -c "omf install bass"
echo_color 'Installing omf "z" plugin...' _ 13
fish -c "omf install z"
# Install the prompt theme (activated from line 6 in .dotfiles/fish/config.fish)
echo_color 'Installing "starship" shell theme support...' _ 13
brew install starship
echo_color 'Installing "thefuck" support...' _ 13
brew install thefuck
fish -c "omf install fuck"

echo_color "Changing shell to \"`which fish`\"..." _ 13
fish_location=$(which fish)
sudo -s eval "which fish | tee -a /etc/shells && chsh -s $fish_location" > /dev/null 2>&1
echo_color "✔ Fish is set up. Restart the terminal to ><>." _ green

context=${1}
if [ "$context"  != 'installer' ]; then
  royal_fin
fi

unset HOMEBREW_NO_AUTO_UPDATE