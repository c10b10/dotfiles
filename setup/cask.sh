#! /bin/zsh
set -e

scriptpath=`dirname "$0"` scriptpath=`cd "$scriptpath" && pwd`
source ${scriptpath}/lib/util.sh $0

apps=(
  alfred
  dropbox
  google-chrome-beta
  transmit
  # appcleaner
  # hazel
  flash
  iterm2
  bettertouchtool
  sublime-text3
  flux
  calibre
  vlc
  # cloudup
  # nvalt
  screenhero
  skype
  utorrent
  gitx-rowanj
  imageoptim
  xld
  the-unarchiver
  limechat
  # QL plugins:
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-json
  quicklook-csv
  betterzipql
  qlimagesize
  webpquicklook
  suspicious-package
)

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo_color "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
echo_done

brew cask alfred link

fin
