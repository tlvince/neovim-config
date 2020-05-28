function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
  setlocal nospell
  setlocal wrap
  :call CocAction('runCommand', 'git.toggleGutters')
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
  setlocal spell
  setlocal nowrap
  :call CocAction('runCommand', 'git.toggleGutters')
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
