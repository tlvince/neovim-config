let g:pandoc_use_hard_wraps = 1
let g:pandoc#modules#disabled = ['chdir']
autocmd BufEnter *.md setlocal filetype=pandoc
autocmd BufEnter ~/docs/wiki/* setlocal filetype=vimwiki
