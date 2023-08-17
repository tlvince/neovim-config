let g:waikiki_wiki_patterns     = ['/wiki/', '/wiki-']
let g:waikiki_default_maps      = 1
let g:waikiki_done              = 'x'
let g:waikiki_space_replacement = '-'
let g:waikiki_index             = 'README.md'

function! waikiki#SetupBufferTlvince() abort
  nnoremap <buffer><silent> <LocalLeader>i               :let &l:cocu = (&l:cocu=="" ? "n" : "")<cr>
  nnoremap <buffer><silent> <LocalLeader>w<LocalLeader>w :execute 'edit diary/' . strftime("%Y-%m-%d") . '.md'<cr>

  " nmap <buffer><silent> <cr> :call waikiki#FollowLink({
  " \ 'action': 'WaikikiWriteFollowLink',
  " \ 'create': 'WaikikiWriteFollowLink'
  " \ })<cr>
endfun

augroup Waikiki
  au!
  autocmd User setup call waikiki#SetupBufferTlvince()
augroup END

" " https://github.com/fcpg/vim-waikiki/issues/5
" function! waikiki#WriteFollowLink(target) abort
"   write
"   execute 'edit' a:target
" endfun

" command! -nargs=? -bar -complete=dir WaikikiWriteFollowLink
"   \ call waikiki#WriteFollowLink(<f-args>)
