" vimrc: a monolithic vim setup. {{{1
" © 2009-2013 Tom Vincent <http://tlvince.com/contact>
" vim: set fdm=marker:

" Environment {{{1
" A consistent runtime environment.

" Forget about vi and set it first as it modifies future behaviour
set nocompatible

" Manually load vim-sensible so we can override its settings later
runtime bundle/vim-sensible/plugin/sensible.vim

set spellfile=$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
set backupdir=$XDG_CONFIG_HOME/nvim/tmp,.
set directory=$XDG_CONFIG_HOME/nvim/tmp,.

" Load plugins managed by pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set rtp+=/usr/share/vim/vimfiles
set rtp+=/usr/local/opt/fzf

" General preferences {{{1
"
" Learn about these using vim help.

" Tabbing
set tabstop=2           " The number of spaces a tab is
set shiftwidth=2        " Number of spaces to use in auto(indent)
set softtabstop=2       " Just to be clear
set expandtab           " Insert tabs as spaces

" Searching
set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character
set hlsearch            " ... as you type

" Wrapping
set textwidth=80        " Hard-wrap text at nth column
set nowrap              " Don't wrap long lines (good for vsplits)

" General
set showmode            " Persistent notice of current mode
set spelllang=en_gb     " Speak proper English
set fillchars=""        " Remove characters in window split
set encoding=utf-8      " Default encoding
set noshowcmd
set clipboard=unnamed
set nomodeline
set modelines=0
set ttimeoutlen=0
set guicursor=          " Fallback to terminal's choice
set shortmess+=c        " don't give |ins-completion-menu| messages

" Ignore the following globs in file completions
set wildignore+=*.o,*.obj,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules

" Visuals {{{1

colorscheme one
set termguicolors
set background=dark
let g:one_allow_italics = 1

augroup vim_one_customisations
  autocmd!
  autocmd ColorScheme one
    \ highlight DiffAdd guibg=Normal |
    \ highlight DiffChange guibg=Normal |
    \ highlight DiffDelete guibg=Normal |
    \ highlight DiffText guibg=Normal |
    \ highlight DiffAdded guibg=Normal |
    \ highlight DiffFile guibg=Normal |
    \ highlight DiffNewFile guibg=Normal |
    \ highlight DiffLine guibg=Normal |
    \ highlight DiffRemoved guibg=Normal |
    \ highlight! link Folded Normal
augroup END

" Mappings {{{1
"
" vim does funny things with inline comments here, so don't use them.

" Silently open a shell in the directory of the current file
if has("win32") || has("win64")
  map ,s :silent !start cmd /k cd %:p:h <CR>
endif

" Return to normal mode
inoremap jk <ESC>

" Always move between wrapped lines
nnoremap j gj
nnoremap k gk

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Leader keys {{{2

" Map leader (the dedicated user-mapping prefix key) to comma
let mapleader = ","
let maplocalleader = ","

" Leader + v to open vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

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

" Create a directory relative to the current file
map <leader>d :!mkdir -p %%

" Write and build the current file
map <leader>m :write<CR> :make %<CR>

" Run the binary of the current file
map <leader>r :!./%:r<CR>

" UTC date
nmap <leader>t a<C-R>=strftime("%Y-%m-%d")<CR>
imap <leader>t <C-R>=strftime("%Y-%m-%d")<CR>

" pwgen
nmap <leader>p :read !pwgen -sy1 32<CR>

" Toggle highlighting of current line and column
nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>

" Toggle spelling and show it's status
nmap <silent><leader>s :setlocal spell! spell?<CR>

nmap <leader>q gqip

" Function keys {{{2

" Toggle paste mode (particularly useful to temporarily disable autoindent)
set pastetoggle=<F3>

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

" Disable Ex mode
nnoremap Q <nop>

" Autocommands {{{1
if has('autocmd')
  " Automatically open the quickfix window on :make
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow

  " Detect indentation settings for all files
  autocmd BufReadPost * :DetectIndent
endif

autocmd BufWritePost ~/docs/wiki/* call AutoCommit()
autocmd BufRead,BufEnter *.js setlocal matchpairs={:},[:]
