#!/usr/bin/env zsh

# Initial settings
source $HOME/.dotfiles/configs/.zshrc
# source $HOME/.dotfiles/configs/.exports
# source $HOME/.dotfiles/configs/.functions

brew install git
brew install tree
brew install jq
brew install yq
brew install tldr
brew install ipcalc

# @see https://github.com/ggreer/the_silver_searcher ag
brew install the_silver_searcher

# @see https://graphviz.org/doc/info/command.html
brew install svn
brew install graphviz

brew install --cask slack
brew install --cask iterm2
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask brave-browser
brew install --cask postman
brew install --cask alfred
brew install --cask shottr
brew install --cask maccy
brew install --cask 1password


# brew install ffmpeg
# brew install --cask aws-vpn-client
# brew install --cask 1password-cli


success "Install homebrew packages successful."
exit 0
