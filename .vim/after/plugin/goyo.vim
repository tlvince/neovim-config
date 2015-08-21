function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
  silent !tmux set-option status off
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
  silent !tmux set-option status on
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
