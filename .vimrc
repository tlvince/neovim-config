" vimrc: a monolithic vim setup. {{{1
" © 2009-2013 Tom Vincent <http://tlvince.com/contact>
" vim: set fdm=marker:

" Environment {{{1
" A consistent runtime environment.

" Forget about vi and set it first as it modifies future behaviour
set nocompatible

" Manually load vim-sensible so we can override its settings later
runtime bundle/vim-sensible/plugin/sensible.vim

set spellfile="$HOME/.vim/spell/en.utf-8.add"

" Load plugins managed by pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

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

" Ignore the following globs in file completions
set wildignore+=*.o,*.obj,*.pyc,.git,.hg,.svn,DS_STORE

" Load man pages in a window (:help find-manpage)
runtime ftplugin/man.vim

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
let base16colorspace=256
colorscheme base16-eighties

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

" Toggle background
map <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Toggle spelling and show it's status
nmap <silent><leader>s :setlocal spell! spell?<CR>

" Function keys {{{2

" Toggle paste mode (particularly useful to temporarily disable autoindent)
set pastetoggle=<F3>

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

" detectindent {{{2
let g:detectindent_preferred_expandtab = 1

" Fugitive {{{2
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gg :Ggrep --ignore-case 
map <silent> <leader>gbd :Gbrowse origin/develop^{}:%<CR>

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
nmap <Leader>a-> :Tabularize /-><CR>
vmap <Leader>a-> :Tabularize /-><CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" Pandoc {{{2
let g:pandoc_use_hard_wraps = 1

" vimwiki {{{2
let g:vimwiki_list = [{
  \ 'path': '~/documents/wiki/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.md'
\ }]

" syntastic {{{2
let g:syntastic_auto_loc_list=1
let g:syntastic_html_tidy_ignore_errors = [' proprietary attribute "ng-']
let g:syntastic_javascript_closure_compiler_path = expand("$CLOSURE_COMPILER_JAR")

" YouCompleteMe {{{2

" Prevent collision with EasyMotion
let g:ycm_key_detailed_diagnostics = ''

" UtilSnips {{{2
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Scratch {{{2
nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" ctrlp {{{2
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_reuse_window = 'startify'

" gitgutter {{{2
" https://github.com/altercation/vim-colors-solarized/pull/62
highlight! link SignColumn Background
autocmd ColorScheme * highlight! link SignColumn Background

" JSDoc {{{2
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_default_mapping = 0
nmap <silent> <leader>j <Plug>(jsdoc)

" Autocommands {{{1
if has('autocmd')
  " Automatically open the quickfix window on :make
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow

  " Detect indentation settings for all files
  autocmd BufReadPost * :DetectIndent

  " Fold JS files
  autocmd FileType javascript call JavaScriptFold()

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
