" .vimrc: a monolithic vim setup.
" Copyright 2010-11 Tom Vincent <http://www.tlvince.com/contact/>

" File specific
filetype on             " Detect file type
filetype plugin on      " Load file type plugins
filetype indent on      " Enable file type based indentation
syntax on               " Enable syntax highlighting

" Tabbing
set tabstop=4           " The number of spaces a tab is
set shiftwidth=4        " Number of spaces to use in auto(indent)
set softtabstop=4       " Just to be clear
set expandtab           " Insert tabs as spaces

" Searching
set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character
set incsearch           " Highlight search
set showmatch           " results
set hlsearch            " as you type

" Wrapping
set textwidth=80        " Hard-wrap text at nth column
set wrap                " Wrap long lines

" General
set nocompatible        " Forget about vi
set ruler               " Show [line,col] number (in status bar)
set showmode            " Persistent notice of current mode
set history=50          " Number of ":" commands and searches to remember 
set spelllang=en_gb     " Speak proper English
set wildmenu            " dmenu style menu for commands
set fillchars=""        " Remove characters in window split
set autochdir           " cd to active file's dir
set encoding=utf-8      " Default encoding
set scrolloff=3         " 3 lines of context

set backspace=indent,eol,start          " Allow backspacing on the given values

" Environment
set backupdir=~/.cache/vim,/tmp         " Put backup files here
set directory=~/.cache/vim,/tmp         " Put swap files here
set viminfo+=n~/.cache/vim/.viminfo     " Put viminfo files here

" GUI
if has('gui_running')
    set guifont=DejaVu_Sans_Mono:h9:cANSI   " Font for GVIM interface
    set guioptions-=T                       " Hide toolbar
    set guioptions-=m                       " Hide menu bar
    set guioptions-=r                       " Hide right hand scroll bar
    set guioptions-=L                       " Hide left hand scroll bar
    colorscheme pyte
else
    colorscheme zenburn
endif

" Mappings
let mapleader = ","

" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Return to normal mode
inoremap jj <ESC>

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h       
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" snipMate
let g:snips_author = 'Tom Vincent <http://www.tlvince.com/contact/>'
