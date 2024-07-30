"      vim/neovim preferences     "
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"

" enable syntax and plugins
syntax enable
filetype plugin on

" load filetype-specific indent files
filetype indent on

" enter the current millennium
set nocompatible
set mouse=a

" pretty
set termguicolors

" rad tab-completion
set path+=**

" why is this so long
set updatetime=250
set timeoutlen=300
set ttimeoutlen=0

" fix annoying cursor hop
set nostartofline

" highlight matching brackets
set showmatch

" show line numbers
set number

" keep sign column visible
set signcolumn=yes

" show highlight line
set cursorline

" highlight all search results
set hlsearch

" do case insensitive search...
set ignorecase
" ...unless \C or capital in search
set smartcase

" show incremental search results as you type
set incsearch

" use OS clipboard
set clipboard=unnamedplus

" make tabs as wide as two spaces
set expandtab
set tabstop=2
set softtabstop=2

" set column line
set colorcolumn=80

" enable break indent
set breakindent

" redraw only when we need to.
set lazyredraw

" set undo directory
set undodir=~/.vim/undo
set undofile

" customizations
set fillchars+=vert:\▏

" remap Esc to jj
inoremap jj <ESC>

" setting below ignored by neovim "
"‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"
if !has('nvim')

    " configure title
    set title
    set titlestring=%f\ -\ vim

    " cursor shape
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

    " theme
    colorscheme bitmap

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
    set statusline+=%1*\ \\%02l\\%02v\                  " line:col
    set statusline+=%0*\ %3p%%\                           " percent

endif
"""
