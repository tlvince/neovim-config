function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
  setlocal nospell
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
  setlocal spell
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
