function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
  setlocal nospell
  setlocal wrap
  Gitsigns toggle_signs false
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
  setlocal spell
  setlocal nowrap
  Gitsigns toggle_signs true
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
