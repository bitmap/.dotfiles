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

" why is this so long
set ttimeoutlen=0

" configure title
set title
set titlestring=%f\ -\ vim

" fix annoying cursor hop
set nostartofline

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

" customizations
set fillchars+=vert:\▏

" statusline
set laststatus=2
set noshowmode
set shortmess=
set statusline=
set statusline+=%0*\ %n\                              " buffer number
set statusline+=%5*%{(mode()==#'n')?'\ NORMAL\ ':''}  " normal mode
set statusline+=%6*%{(mode()==#'i')?'\ INSERT\ ':''}  " insert mode
set statusline+=%7*%{(mode()==#'R')?'\ REPLACE\ ':''} " replace mode
set statusline+=%8*%{(mode()==?'v')?'\ VISUAL\ ':''}  " visual mode
set statusline+=%9*%{(mode()==#'c')?'\ COMMAND\ ':''} " command mode
set statusline+=%1*\ %<%F\                            " file path
set statusline+=%1*\%{&modified?'\*\ ':''}            " modified
set statusline+=%1*\%{&readonly?'\\ ':''}            " read-only
set statusline+=%2*%=                                 " right side
set statusline+=%2*\ %{&filetype}\                    " filetype
set statusline+=%2*\%{''.(&fenc!=''?&fenc:&enc).''}\  " encoding
set statusline+=%2*\(%{&ff})\                         " file format
set statusline+=%1*\ %02l:%02v\                       " line:col
set statusline+=%0*\ %3p%%\                           " percent
