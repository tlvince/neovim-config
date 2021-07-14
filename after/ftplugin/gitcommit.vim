" https://old.reddit.com/r/vim/comments/dj37wt/plugin_for_conventional_commits/

inoreabbrev <buffer> BB BREAKING CHANGE:
nnoremap    <buffer> i  i<C-r>=<sid>commit_type()<CR>

fun! s:commit_type()
  call complete(1, ['feat: ', 'fix: ', 'chore: ', 'refactor: ', 'ci: ', 'docs: ', 'perf: ', 'build: ', 'revert: ', 'style: ', 'test: '])
  nunmap <buffer> i
  return ''
endfun
