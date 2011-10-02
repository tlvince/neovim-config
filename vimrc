" vimrc: a monolithic vim setup. {{{1
" Copyright 2009-2011 Tom Vincent <http://www.tlvince.com/contact/>
" vim: set fdm=marker:

" Environment {{{1
"
" A consistent runtime environment.

" Forget about vi and set it first as it modifies future behaviour
set nocompatible

" Make vim respect the XDG base directory spec.
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

" Load plugins managed by pathogen
call pathogen#infect()

" General preferences {{{1
"
" Learn about these using vim help.

" File based
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
set incsearch           " Highlight search...
set showmatch           " ... results
set hlsearch            " ... as you type

" Wrapping
set textwidth=80        " Hard-wrap text at nth column
set wrap                " Wrap long lines

" General
set ruler               " Show [line,col] number (in status bar)
set showmode            " Persistent notice of current mode
set history=50          " Number of ":" commands and searches to remember 
set spelllang=en_gb     " Speak proper English
set wildmenu            " dmenu style menu for commands
set fillchars=""        " Remove characters in window split
set encoding=utf-8      " Default encoding
set scrolloff=3         " 3 lines of context

set backspace=indent,eol,start          " Allow backspacing on the given values

" Visuals {{{1
"
" Set up gvim, colour schemes and the like.

if has('gui_running')
    if has('win32') || has('win64')
        set guifont=DejaVu_Sans_Mono:h11,Consolas:h11,Courier_New:h11
    else
        set guifont=Monospace\ 11                " Fallback to system default
    endif
    set guioptions-=T                       " Hide toolbar
    set guioptions-=m                       " Hide menu bar
    set guioptions-=r                       " Hide right hand scroll bar
    set guioptions-=L                       " Hide left hand scroll bar
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme molokai
endif

" Mappings {{{1
"
" vim does funny things with inline comments here, so don't use them.

" Silently open a shell in the directory of the current file
if has("win32") || has("win64")
    map ,s :silent !start cmd /k cd %:p:h <CR>
endif

" Return to normal mode
inoremap jj <ESC>

" Always move between wrapped lines
nnoremap j gj
nnoremap k gk

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h       
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Sudo to write
if has ('unix')
    cmap w!! w !sudo tee % >/dev/null
endif

" Leader keys {{{2

" Map leader (the dedicated user-mapping prefix key) to comma
let mapleader = ","

" Leader + v to open vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Leader + t to open a new tab
nmap <leader>t :tabnew<CR>

" Open a file (relative to the current file)
" See: http://vimcasts.org/episodes/the-edit-command/
" Synonyms: {e: edit, where: {w: window, s: split, v: vertical split, t: tab}}
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Disable search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Write and build the current file
map <leader>m :write<CR> :make<CR>

" Function keys {{{2

" Toggle NERDTree plugin
map <F2> :NERDTreeToggle<CR>

" Toggle paste mode (particularly useful to temporarily disable autoindent)
set pastetoggle=<F3>

" Toggle spelling and show it's status
map <F7> :setlocal spell! spell?<CR>

" Disabled keys {{{2

" Disable arrow keys (force good habits)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Plugins {{{1

" NERDTree
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" snipMate
let g:snips_author='Tom Vincent <http://tlvince.com/contact/>'
let g:snippets_dir="$XDG_CONFIG_HOME/vim/bundle/snipmate-snippets"

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Autocommands {{{1
if has('autocmd')
    " Always fold Python files
    autocmd Filetype python set foldmethod=indent

    " Re-source vimrc whenever changes are saved
    autocmd BufWritePost vimrc source $MYVIMRC

    " Bind leader + p to preview Markdown files
    autocmd Filetype markdown nmap <leader>p :call PreviewMarkdown()<CR>

    " Fold Markdown files based on the heading level
    autocmd Filetype markdown set foldmethod=expr foldexpr=HeadingLevel(v:lnum)

    " Syntax highlight Pandoc files
    autocmd Bufread,BufNewFile *.pdc set filetype=pdc

    " Enable omni-complete for Python files
    autocmd Filetype python set omnifunc=pythoncomplete#Complete

    " Automatically open the quickfix window on :make
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow

    " Enable the Python compiler plugin
    autocmd Filetype python compiler python

    " Enable the occam-pi compiler plugin
    autocmd Filetype occam compiler occam-pi
endif

" Functions {{{1

" Preview Markdown files, depending on an external script.
function! PreviewMarkdown()
    :write
    :silent !markdown "%"
    :redraw!
endfunction

" Return the level of setext and atx style headers.
" See: http://tech.groups.yahoo.com/group/vim/message/120033
function! HeadingLevel(lnum)
    let l1 = getline(a:lnum)

    " Ignore empty lines
    if l1 =~ '^\s*$'
        return '='
    endif

    " Setext-style headers begin on the line below
    let l2 = getline(a:lnum+1)
    if l2 =~ '^=\+\s*'
        return '>1'
    elseif l2 =~ '^-\+\s*'
        return '>2'

    " Check for atx-style headers
    elseif l1 =~ '^#'
        return '>'.matchend(l1, '^#\+')

    " Otherwise keep the previous foldlevel
    else
        return '='
    endif
endfunction
