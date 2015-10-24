let g:vimwiki_list = [{
  \ 'path': '~/documents/wiki/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.md'
\ }]

autocmd BufEnter ~/documents/wiki/* setlocal filetype=vimwiki
autocmd BufWritePost ~/documents/wiki/* call AutoCommit()
