#! /bin/zsh
set -e

scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

apps=(
  alfred
  dropbox
  dashlane
  google-chrome
  transmit
  # appcleaner
  # hazel
  flash
  iterm2
  bettertouchtool
  sublime-text3
  calibre
  vlc
  quip
  telegram
  skype
  utorrent
  fork
  imageoptim
  xld
  the-unarchiver
  visual-studio-code
  spotify
  limechat
  # QL plugins:
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  suspicious-package
  quicklookase
  qlvideo
)

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo_color "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
echo_done

brew cask alfred link

fin
