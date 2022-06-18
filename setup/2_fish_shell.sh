#! /bin/zsh

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

check_if_homebrew_installed

export HOMEBREW_NO_AUTO_UPDATE=1

echo_color "Installing fish..." _ 13
brew install fish

ln -fs $dotpath/fish $HOME/.config/fish
echo_color "Linked \"$dotpath/fish\" to \"$HOME/.config/fish\"..." _ green

# omf
if $(ls -l $HOME/.local/share/omf >/dev/null 2>&1); then
  echo_color '"ohmyfish (omf)" already installed. Skipping install.' _ yellow
else
  echo_color 'Installing "ohmyfish (omf)"...' _ 13
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

# omf git
echo_color 'Installing omf "git" plugin...' _ 13
fish -c "omf install https://github.com/jhillyerd/plugin-git"

# omf bass
echo_color 'Installing omf "bass" plugin...' _ 13
fish -c "omf install bass"

# omf z
echo_color 'Installing omf "z" plugin...' _ 13
fish -c "omf install z"

# omf starship (fish prompt - activated from line 6 in .dotfiles/fish/config.fish)
echo_color 'Installing "starship" shell theme support...' _ 13
brew install starship
# linking starship config
rm -f $HOME/.config/starship.toml
echo_color "Linked $dotpath/starship.toml to $HOME/.config/starship.toml" _ green
ln -fs $dotpath/starship.toml $HOME/.config/starship.toml

# change shell to fish
echo_color "Changing shell to \"$(which fish)\"..." _ 13
sudo -s eval "which fish | tee -a /etc/shells" >/dev/null 2>&1
chsh -s $(which fish)
echo_color "✔ Fish is set up. Restart the terminal to ><>." _ green

context=${1}
if [ "$context" != 'installer' ]; then
  royal_fin
fi

unset HOMEBREW_NO_AUTO_UPDATE
