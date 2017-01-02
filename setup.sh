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

echo "Updating submodules"
git submodule init
git submodule update

echo "Signing in to MAS" 
brew install mas
mas signin --dialog $EMAIL

echo "Installing all Homebrew recipes (relies on Brewfile being stowed)"
brew tap Homebrew/bundle
brew bundle --global

echo "Setting Homebrew's zsh"
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

echo "Opening iTerm2 theme directory so you can install them"
open shared/iterm2-themes/

echo "Symlinking vim to nvim"
ln -s /usr/local/bin/nvim /usr/local/bin/vim

echo "Configuring gpg"
cp shared/gpg.conf ~/.gnupg/
cp shared/gpg-agent.conf ~/.gnupg/

echo "All done!"
echo "- You can install a Ruby using, e.g., 'ruby-install ruby'"
echo "- Be sure to install your SSH and GPG key data (gpg1 --import /Path/To/File.asc)"
echo "- Please restart the computer for everything to work right"
