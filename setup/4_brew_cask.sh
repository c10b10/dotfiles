#! /bin/zsh
# Updated 26.11.2020

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

check_if_homebrew_installed

export HOMEBREW_NO_AUTO_UPDATE=1

browsers=(
  google-chrome
  tor-browser
)
communication=(
  # discord
  # gotomeeting
  # limechat
  skype
  slack
  telegram
  messenger
  whatsapp
)
development=(
  dash
  fork
  imageoptim
  iterm2
  insomnia
  notion
  visual-studio-code
  openvpn
  qmk-toolbox
)
essentials=(
  adobe-acrobat-reader
  alfred
  bettertouchtool
  calibre
  dashlane
  dropbox
  keepingyouawake
  kindle
  spotify
  the-unarchiver
  vlc
  xld
  forklift
)
qlplugins=(
  qlcolorcode
  quicklook-json
  qlstephen
  qlmarkdown
)
torrenting=(
  transmission
)

echo_color "We'll start installing brew cask apps in a moment.." _ yellow

brew tap homebrew/cask
brew tap homebrew/cask-versions

function install_apps() {
  app_category=$1
  apps_string="${@:2}"
  echo "\n"
  echo_color "Attempting to install ${app_category} \"$apps_string\"" _ 13
  default="y"
  answer=$default
  for app in ${@:2}; do
    if [ "$answer" != 'a' ]; then
      user_input=
      vared -p "Install \"${app}\" [y/enter], skip it [n], or install it and all the rest of the ${app_category} [a]: " user_input
      case $user_input in
      y | Y | "") answer=$default ;;
      a | A) answer="a" ;;
      *) answer="n" ;;
      esac
    fi

    if [ "$answer" = 'y' ] || [ "$answer" = 'a' ]; then
      echo_color "Installing \"${app}\"..." _ yellow
      brew install --cask --appdir=\"/Applications\" $app
    else
      echo_color "Skipped \"${app}\"." _ yellow
    fi
  done
  echo_color "✔ Finished with $app_category \"$apps_string\"." _ green
}

install_apps "browsers" $browsers
install_apps "communication apps" $communication
install_apps "development tools" $development
install_apps "essential apps" $essentials
install_apps "torrenting apps" $torrenting

# Enable QL plugins
echo_color "Activating QuickLook plugins..." _ 13
xattr -r ~/Library/QuickLook
# Disable QL plugins
# xattr -d -r com.apple.quarantine ~/Library/QuickLook
echo_color "✔ QuickLook plugins activated. To disable them run \"xattr -d -r com.apple.quarantine ~/Library/QuickLook\"." _ green

context=${1}
if [ "$context" != 'installer' ]; then
  royal_fin
fi

unset HOMEBREW_NO_AUTO_UPDATE
