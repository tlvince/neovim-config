set nocompatible        " Forget about vi
set showmode            " Persistent notice of current mode

colorscheme molokai      " TODO: this should be conditional

filetype on             " Detect file type
filetype plugin on      " Load file type plugins
filetype indent on      " Enable file type based indentation
syntax on               " Enable syntax highlighting

set tabstop=4           " The number of spaces a tab is
set shiftwidth=4        " Number of spaces to use in auto(indent)
set expandtab           " Insert tabs as spaces

set ruler               " Show [line,col] number (in status bar)
set history=50          " Number of ":" commands and searches to remember 
set textwidth=80        " Wrap text at nth column
set spelllang=en_gb     " Speak proper English
set wildmenu            " dmenu style menu for commands

set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character

set backspace=indent,eol,start          " Allow backspacing on the given values

if has('gui_running')
    set guifont=DejaVu_Sans_Mono:h9:cANSI   " Font for GVIM interface
    set guioptions-=T                       " Hide toolbar
    set guioptions-=m                       " Hide menu bar
    set guioptions-=r                       " Hide right hand scroll bar
endif

set backupdir=~/.cache/vim,/tmp     " Put backup files here
set directory=~/.cache/vim,/tmp     " Put swap files here
