echo "Sourcing dotfiles/.envrc"
source .envrc

echo "Checking for brew command"
if ! type brew >/dev/null 2>&1; then
  echo "Brew not found, installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Updating brew"
brew update

echo "Checking for stow"
if ! type stow >/dev/null 2>&1; then
  echo "Stow not found, installing..."
  brew install stow
fi

echo "Stowing files into dev/"
stow dev

echo "Signing in to MAS" 
brew install mas
mas signin --dialog $EMAIL

echo "Installing all Homebrew recipes (relies on Brewfile being stowed)"
brew tap Homebrew/bundle
brew bundle --global

echo "Opening iTerm2 theme directory so you can install them"
open shared/iterm2-themes/

echo "All done!"
echo "- You can install a Ruby using, e.g., 'ruby-install ruby'"
echo "- Be sure to install your SSH and GPG key data"
echo "- Please restart the computer for everything to work right"
