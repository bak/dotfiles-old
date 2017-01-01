Store dotfile sources here, under the dev package. Use `stow` (available in Homebrew) to move them up a directory:

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

The nvim config uses [pathogen](https://github.com/tpope/vim-pathogen). To install a plugin, submodule it into `dev/.config/nvim/bundle/`.
