#!/bin/bash
set -e

# Homebrew

apps=(
  alfred
  dropbox
  google-chrome-beta
  qlcolorcode
  transmit
  appcleaner
  # hazel
  qlmarkdown
  flash
  iterm2
  qlprettypatch
  bettertouchtool
  sublime-text3
  flux
  calibre
  qlstephen
  vlc
  # cloudup
  # nvalt
  quicklook-json
  screenhero
  skype
  utorrent
  gitx-rowanj
  imageoptim
  xld
  the-unarchiver
  limechat
)

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link
