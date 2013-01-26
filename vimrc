" vimrc: a monolithic vim setup. {{{1
" Copyright 2009-2012 Tom Vincent <http://www.tlvince.com/contact/>
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
let g:netrw_home=expand("$XDG_CACHE_HOME/vim")

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
set tabstop=2           " The number of spaces a tab is
set shiftwidth=2        " Number of spaces to use in auto(indent)
set softtabstop=2       " Just to be clear
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
set nowrap              " Don't wrap long lines (good for vsplits)

" General
set ruler               " Show [line,col] number (in status bar)
set showmode            " Persistent notice of current mode
set history=50          " Number of ":" commands and searches to remember
set spelllang=en_gb     " Speak proper English
set wildmenu            " dmenu style menu for commands
set fillchars=""        " Remove characters in window split
set encoding=utf-8      " Default encoding
set scrolloff=3         " 3 lines of context

set backspace=indent,eol,start  " Allow backspacing on the given values

" Ignore the following globs in file completions
set wildignore+=*.o,*.obj,*.pyc,.git

" Load man pages in a window (:help find-manpage)
runtime! ftplugin/man.vim

" Visuals {{{1

" GVim {{{2
if has('gui_running')
  if has('win32') || has('win64')
      set guifont=DejaVu_Sans_Mono:h11,Consolas:h11,Courier_New:h11
  else
      set guifont=Monospace\ 11   " Fallback to system default
  endif
  set guioptions-=T               " Hide toolbar
  set guioptions-=m               " Hide menu bar
  set guioptions-=r               " Hide right hand scroll bar
  set guioptions-=L               " Hide left hand scroll bar
endif

" Colourscheme {{{2
set background=dark
colorscheme solarized

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

" Sudo to write
if has ('unix')
  cmap w!! SudoWrite<CR>
endif

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

" Write and build the current file
map <leader>m :write<CR> :make %<CR>

" Run the binary of the current file
map <leader>r :!./%:r<CR>

" UTC date
nmap <leader>d a<C-R>=strftime("%Y-%m-%d")<CR>
imap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" pwgen
nmap <leader>p :read !pwgen -sy1 32<CR>

" Toggle highlighting of current line and column
nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>

" Function keys {{{2

" Toggle paste mode (particularly useful to temporarily disable autoindent)
set pastetoggle=<F3>

" Toggle spelling and show it's status
map <F7> :setlocal spell! spell?<CR>

nmap <F8> :TagbarToggle<CR>

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

" Plugins {{{1

" SuperTab {{{2
let g:SuperTabDefaultCompletionType = "context"

" detectindent {{{2
let g:detectindent_preferred_expandtab = 1

" Fugitive {{{2
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" neocomplcache {{{2
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_auto_delimiter = 1

let g:neocomplcache_temporary_dir = expand("$XDG_CACHE_HOME/neocon")

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
  \"\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin key-mappings.
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()

" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" neocomplcache-snippets {{{2
let g:snips_author='Tom Vincent <http://tlvince.com/contact>'
let g:neocomplcache_snippets_dir ="$XDG_CONFIG_HOME/vim/bundle/snipmate-snippets"

imap <C-k>  <Plug>(neocomplcache_snippets_expand)
smap <C-k>  <Plug>(neocomplcache_snippets_expand)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tabularize {{{2
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
nmap <Leader>a- :Tabularize /-<CR>
vmap <Leader>a- :Tabularize /-<CR>

" Pandoc {{{2
let g:pandoc_use_hard_wraps = 1

" Solarized {{{2
" Toggle background
call togglebg#map("<F5>")

" Sunset {{{2
let g:sunset_latitude   = 22.278333
let g:sunset_longitude  = 114.158889
let g:sunset_utc_offset = 8

" vimwiki {{{2
let g:vimwiki_list = [{
  \ 'path': '~/doc/wiki/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.mkd'
\ }]

" Autocommands {{{1
if has('autocmd')
  " Automatically open the quickfix window on :make
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow

  " Re-source vimrc whenever changes are saved
  autocmd BufWritePost vimrc source $MYVIMRC

  " Detect indentation settings for all files
  autocmd BufReadPost * :DetectIndent

  " http://wholemeal.co.nz/blog/2012/03/11/secure-password-storage-with-vim-and-gpg/
  augroup encrypted
      au!

      " First make sure nothing is written to ~/.viminfo while editing
      " an encrypted file.
      autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
      " We don't want a swap file, as it writes unencrypted data to disk
      autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
      " Switch to binary mode to read the encrypted file
      autocmd BufReadPre,FileReadPre      *.gpg set bin
      autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
      autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt 2> /dev/null
      " Switch to normal mode for editing
      autocmd BufReadPost,FileReadPost    *.gpg set nobin
      autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
      autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

      " Convert all text to encrypted text before writing
      autocmd BufWritePre,FileWritePre    *.gpg   '[,']!gpg --default-recipient-self -ae 2>/dev/null
      " Undo the encryption so we are back in the normal text, directly
      " after the file has been written.
      autocmd BufWritePost,FileWritePost  *.gpg   u

      " Fold entries by default
      autocmd BufReadPre,FileReadPre      *.gpg set foldmethod=expr
      autocmd BufReadPre,FileReadPre      *.gpg set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
  augroup END
endif
