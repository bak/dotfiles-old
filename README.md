Store dotfile sources here, under the dev package. Use `stow` (available in
Homebrew) to move them up a directory:

```
$ pwd
/Users/ben/dotfiles
$ ls dev
.gitconfig
$ stow dev
$ cd ..
$ ls -al .gitconfig
.gitconfig -> dotfiles/dev/.gitconfig
```

The nvim config uses [pathogen](https://github.com/tpope/vim-pathogen). To
install more plugins, submodule them into `dev/.config/nvim/bundle/`, configure
each with a local excludesfile, and commit the subproject and the changes to
`.gitmodules`:

```
$ git submodule add git@github.com:tpope/vim-vinegar.git dev/.config/nvim/bundle/vim-vinegar
$ git submodule foreach git config --local core.excludesfile "../.gitignore_submodules"
$ git add .gitmodules dev/.config/nvim/bundle/vim-vinegar
$ git commit -m "Installs vim-vinegar"
```

To configure the machine and install packages, first install `Xcode.app` via
the App Store, install the `Command Line Tools`, and then run `setup.sh`.
