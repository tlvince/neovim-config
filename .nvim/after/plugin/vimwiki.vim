let g:vimwiki_list = [{
  \ 'path': '~/Documents/wiki/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.md'
\ }]

autocmd BufEnter ~/Documents/wiki/* setlocal filetype=vimwiki
autocmd BufWritePost ~/Documents/wiki/* call AutoCommit()
