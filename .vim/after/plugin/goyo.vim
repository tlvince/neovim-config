function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
