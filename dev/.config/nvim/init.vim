if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme onehalfdark
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
set nocompatible
set encoding=utf-8
set modelines=0 " Don't allow files to change settings

set colorcolumn=80
let mapleader = ","

" truecolor support for vim running in tmux
" I have no idea what this does
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" FZF, C-l to fuzzyfind files
set rtp+=/usr/local/opt/fzf
nmap <C-l> :Files<CR>
let g:fzf_preview_window = 'right:20%'

" bad typist
command WQ wq
command Wq wq
command W w
command Q q

" just use the system clipboard
set clipboard=unnamed

" configure vim-test
let test#strategy = "dispatch"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Configure ack.vim to use ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Configure wildfire.vim
" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)

" Configure ALE
let g:ale_linters = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'ruby': ['standardrb'],
      \ }
let g:ale_fixers  = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'ruby': ['standardrb'],
      \ }

let g:ale_set_highlights = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

" find under word
noremap <leader>f <Esc>:Ack<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" sign column match colors
highlight SignColumn ctermbg=black

" line break without breaking words
set wrap
set linebreak
set nolist  " list disables linebreak

" Use symbols for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set Statusline
set statusline=%f\ \|\ col\:\ %c\ %{fugitive#statusline()}
set ruler

" Set Linenumbering
set nu

" backspace over everything in insert mode
set backspace=indent,eol,start

" set backupdir, but don't use them
set backupdir=~/.config/nvim/backup

" swap dir
set directory=~/.config/nvim/tmp

set scrolloff=3    " context
set visualbell     " flash
set history=50     " keep 50 lines of command line history
set showcmd        " display incomplete commands

" Search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set hlsearch
set incsearch
set showmatch

" Move within wrappings
nnoremap j gj
nnoremap k gk

" Re-select visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" turn off help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Commenting
noremap <Leader>/ :TComment<CR>

" Tab completion options
imap <Tab> <C-P>
set complete=.,b,u,]
set wildmode=longest,list:longest
