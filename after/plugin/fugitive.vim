nnoremap <silent> <leader>ga :Git add %:p<CR><CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit -v -q<CR>
nnoremap <silent> <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR><CR>
nnoremap <silent> <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <silent> <leader>gg :Ggrep --ignore-case<Space>
nnoremap <silent> <leader>gm :Gmove<Space>
nnoremap <silent> <leader>gb :Git branch<Space>
nnoremap <silent> <leader>go :Git checkout<Space>
nnoremap <silent> <leader>gpu :Git push<CR>
nnoremap <silent> <leader>gpd :Git pull<CR>
set diffopt+=vertical
