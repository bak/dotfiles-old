#!/usr/bin/env sh

set -e

if [ "$(git status --porcelain)" ]; then 
  echo "Dotfiles repo has changes, please commit or clear before proceeding"
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Supply the package name, e.g., package.vim, and nothing else"
  exit 1
fi

git submodule deinit -f dev/.local/share/nvim/site/pack/git-plugins/start/$1
git rm dev/.local/share/nvim/site/pack/git-plugins/start/$1
git commit -m "Removes $1"
rm -rf .git/modules/dev/.local/share/nvim/site/pack/git-plugins/start/$1
