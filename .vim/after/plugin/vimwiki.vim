let g:vimwiki_list = [{
  \ 'path': '~/documents/wiki/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.md'
\ }]

autocmd BufWritePost ~/documents/wiki/* call AutoCommit()
