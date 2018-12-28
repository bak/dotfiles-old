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

Neovim uses the XDG base directory standard. To install more plugins,
submodule them into `dev/.local/share/nvim/site/pack/git-plugins/start/`,
configure each with a local excludesfile, and commit the subproject and
the changes to `.gitmodules`:

```
$ git submodule add https://github.com/tpope/vim-vinegar.git dev/.local/share/nvim/site/pack/git-plugins/start/vim-vinegar
$ git submodule foreach git config --local core.excludesfile "../.gitignore_submodules"
$ git add .gitmodules dev/.local/share/nvim/site/pack/git-plugins/start/vim-vinegar
$ git commit -m "Installs vim-vinegar"
```

To configure the machine and install packages, first install the `Command
Line Tools`, and then run `setup.sh`.
