## Installation

### Method 1

1. Clone the repo to ~/.dotfiles and cd to it with `cd ~/.dotfiles`
1. Run `install.sh` after adding execution rights to it: `chmod +x install.sh`
1. Add execution permissions to the setup scripts with
`chmod +x ~/.dotfiles/setup/*`
1. Run the cli tools script `~/.dotfiles/setup/cli_tools.sh`
1. Run whatever scripts are needed from `~/.dotfiles/setup`

You might want to modify the user settings in .gitconfig.

### Vim

If you installed the python tools with homebrew `brew install python`, make sure
you install MacVim using cask if you want for the YouCompleteMe plugin to work.
See more about how to do that
[in this thread](https://github.com/Valloric/YouCompleteMe/issues/18#issuecomment-146546485)
on the YCM repo.
