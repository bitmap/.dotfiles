" load plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
call plug#end()

" utf-8
set encoding=utf-8

" enter the current millennium
set nocompatible

" pretty
colorscheme bitmap
syntax enable

" enable syntax and plugins
filetype plugin on

" load filetype-specific indent files
filetype indent on

" rad tab-completion
set path+=**
set wildmenu

" INSERT tweaks
set esckeys
set backspace=indent,eol,start

" enable mouse
set mouse=a

" configure title
set title
set titlestring=%f\ –\ vim

" fix annoying cursor hop
set nostartofline
set ruler

" highlight matching brackets
set showmatch

" show line numbers
set number

" show highlight line
set cursorline

" highlight all search results
set hlsearch

" do case insensitive search
set ignorecase

" show incremental search results as you type
set incsearch

" disable swap file
set noswapfile

" map system keyboard to paster buffer
set clipboard=unnamedplus

" make tabs as wide as two spaces
set expandtab
set tabstop=2
set softtabstop=2

" redraw only when we need to.
set lazyredraw

" cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" set undo directory
set undodir=~/.vim/undo

" remap Esc to jj
inoremap jj <ESC>

" statusline
set laststatus=2
set noshowmode
set shortmess=
set statusline=
set statusline+=%4*\ %<%t\                               " file path
set statusline+=%3*%{&modified?'\*\ ':''}                " modified
set statusline+=%3*%{&readonly?'\\ ':''}                " read-only
set statusline+=%=                                       " right side
set statusline+=%1*\ %{&filetype}\                       " filetype
set statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''}\    " encoding
set statusline+=%1*\ %{&ff}\                             " file format
set statusline+=%1*\ %l:%c\                              " line and col
set statusline+=%1*\ %p%%\                               " percent

set statusline+=%5*%{(mode()==#'n')?'\ NORMAL\ ':''}
set statusline+=%6*%{(mode()==#'i')?'\ INSERT\ ':''}
set statusline+=%7*%{(mode()==#'R')?'\ REPLACE\ ':''}
set statusline+=%8*%{(mode()==?'v')?'\ VISUAL\ ':''}
set statusline+=%9*%{(mode()==#'c')?'\ COMMAND\ ':''}
