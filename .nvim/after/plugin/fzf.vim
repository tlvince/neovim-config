nnoremap <silent> <C-p> :FZF<CR>

inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)
