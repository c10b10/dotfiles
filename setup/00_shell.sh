#!/bin/bash

echo -e "=Trying to setup the shell.\n"

if [[ -z $C10_DOTFILES ]]; then
	read -p "Full path to the dotfiles repo: " C10_DOTFILES
	eval C10_DOTFILES=$C10_DOTFILES
fi

if [[ ! -d $C10_DOTFILES ]]; then
	echo "Directory $C10_DOTFILES does not exist."
	exit 1
fi

export C10_DOTFILES=$C10_DOTFILES

# Link the config files
sudo chmod +x $C10_DOTFILES/bin/c10-relink-dotfiles
$C10_DOTFILES/bin/c10-relink-dotfiles

# Create the c10 config file
echo "Creating the $HOME/.c10 file..."
rm -f $HOME/.c10
echo "export C10_DOTFILES=$C10_DOTFILES" >.c10
echo Done!

echo -e "\nChanging shell to zsh..."
chsh -s $(which zsh)
echo Done!

echo -e "\n=Shell is now set up. Restart your terminal to see the magic."
