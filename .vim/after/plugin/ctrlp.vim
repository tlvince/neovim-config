let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'git ls-files --cached --others --exclude-standard %s'],
  \ },
  \ 'fallback': 'ag %s --ignore-case --nocolor --nogroup --nobreak --ignore "\.git$\|\.hg$\|\.svn$" -g "" %s'
\ }
