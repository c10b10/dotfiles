#! /bin/zsh
# Updated 26.11.2020

dotpath=$(git rev-parse --show-toplevel)
source ${dotpath}/setup/lib/util.sh $0

vared -p 'Install Homebrew [y/enter] or skip [n]: ' -c answer
case $answer in
  (y | Y | "") source $dotpath/setup/__brew_install.sh "installer";;
  (*) echo_color "Skipped installing Homebrew." _ yellow;;
esac

vared -p 'Install fish shell [y/enter] or skip [n]: ' -c answer
case $answer in
  (y | Y | "") source $dotpath/setup/fish_shell.sh "installer";;
  (*) echo_color "Skipped installing fish shell." _ yellow;;
esac

vared -p 'Install cli tools [y/enter] or skip [n]: ' -c answer
case $answer in
  (y | Y | "") source $dotpath/setup/brew_cli.sh "installer";;
  (*) echo_color "Skipped installing cli tools." _ yellow;;
esac

vared -p 'Install brew cask apps [y/enter] or skip [n]: ' -c answer
case $answer in
  (y | Y | "") source $dotpath/setup/brew_cask.sh "installer";;
  (*) echo_color "Skipped installing brew cask apps." _ yellow;;
esac

royal_fin