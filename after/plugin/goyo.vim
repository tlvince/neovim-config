function! s:goyo_before()
  setlocal noshowmode
  setlocal noshowcmd
  setlocal nospell
  setlocal wrap
  Gitsigns toggle_signs false
  lua require('cmp').setup({ enabled = false })
endfunction

function! s:goyo_after()
  setlocal showmode
  setlocal showcmd
  setlocal spell
  setlocal nowrap
  Gitsigns toggle_signs true
  lua require('cmp').setup({ enabled = true })
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
