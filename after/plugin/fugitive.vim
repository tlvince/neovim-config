nnoremap <silent> <leader>ga :Git add %:p<CR><CR>
nnoremap <silent> <leader>gb :Git blame<CR>
vnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Git commit -v -q<CR>
nnoremap <silent> <leader>gt :Git commit -v -q %:p<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR><CR>
nnoremap <silent> <leader>gl :silent! Gclog<CR>:bot copen<CR>
nnoremap <silent> <leader>gg :Ggrep --ignore-case<Space>
nnoremap <silent> <leader>gm :GMove<Space>
nnoremap <silent> <leader>go :Git checkout<Space>
nnoremap <silent> <leader>gpu :Git push<CR>
nnoremap <silent> <leader>gpd :Git pull<CR>
set diffopt+=vertical
