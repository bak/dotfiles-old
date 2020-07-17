Store dotfile sources here, under the dev package. Uses `stow` to move them up a directory. See `setup.sh`

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
