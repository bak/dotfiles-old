#!/usr/bin/env sh

set -e

if [ "$(git status --porcelain)" ]; then 
  echo "Dotfiles repo has changes, please commit or clear before proceeding"
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Supply the clone url to the script and nothing else"
  exit 1
fi

plugin=`basename $1 .git`
resp=`curl -o /dev/null -L --silent --head $1 --write-out "%{http_code}"`

if [[ $resp != 200 ]]; then
  echo "Clone url $1 doesn't seem to exist: $resp"
  exit 1
fi

git submodule add $1 dev/.local/share/nvim/site/pack/git-plugins/start/$plugin
git submodule foreach git config --local core.excludesfile "../.gitignore_submodules"
git add .gitmodules dev/.local/share/nvim/site/pack/git-plugins/start/$plugin
git commit -m "Installs $plugin"
