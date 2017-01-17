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

The nvim config uses [pathogen](https://github.com/tpope/vim-pathogen). To install plugins, submodule it into `dev/.config/nvim/bundle/`, and configure each with a local excludesfile:

```
$ git submodule add https://github.com/vimwiki/vimwiki.git
$ git submodule add git@github.com:vim-ruby/vim-ruby
$ git submodule foreach git config --local core.excludesfile "../.gitignore_submodules"
```
