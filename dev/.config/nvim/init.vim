syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on

set nocompatible
set encoding=utf-8
set modelines=0 " Don't allow files to change settings

let mapleader = ","

" ctrlp mapped to ctrl-l
let g:ctrlp_map = '<c-l>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" bad typist
command WQ wq
command Wq wq
command W w
command Q q

" just use the system clipboard
set clipboard=unnamed

" configure vim-test
let test#strategy = "vtr"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" configure tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" Configure ack.vim to use ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

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

let g:ale_set_highlights = 0
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

" find under word
noremap <leader>f <Esc>:Ack<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" sign column match colors
highlight SignColumn ctermbg=black

autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab

" line break without breaking words
set wrap
set linebreak
set nolist  " list disables linebreak

" Use symbols for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" toggle hidden chars
nnoremap <leader>l :set list!<CR>

" Set Statusline
set statusline=%t\ %{fugitive#statusline()}
set ruler          " show the cursor position all the time

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

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vnoremap P p :call setreg('"', getreg('0')) <CR>

" Commenting
noremap <Leader>/ :TComment<CR>

" Tab completion options
imap <Tab> <C-P>
set complete=.,b,u,]
set wildmode=longest,list:longest
