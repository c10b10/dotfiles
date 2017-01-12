#! /bin/zsh

# Include utils
scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

# Homebrew
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Change permissions to avoid permissions errors on brew update
sudo chown -R $USER /usr/local
brew update
brew install fish
echo_color "Make sure you run \"chsh -s `which fish`\" after you've added the path to the fish shell to \"/etc/shells\""

royal_fin
