#!/bin/sh

echo "Sourcing dotfiles/.envrc"
source .envrc

echo "Cloning theme repo"
git submodule add https://github.com/sonph/onehalf.git shared/onehalf

echo "Opening iTerm themes. Install them."
open shared/onehalf/iterm

echo "Installing vim theme"
cp -R shared/onehalf/vim dev/.local/share/nvim/site/pack/git-plugins/start/onehalf
