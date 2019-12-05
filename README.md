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

Neovim uses the XDG base directory standard. To install more plugins, use the provided script:

```
$ ./install-vim-plugin.sh https://github.com/tpope/vim-vinegar.git
```

To uninstall a plugin, use the other provided script:

```
$ ./uninstall-vim-plugin.sh vim-vinegar
```

To configure the machine and install packages, first install the `Command
Line Tools`, and then run `setup.sh`.
