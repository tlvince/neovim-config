" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show documentation in preview window
nmap K :call CocAction('doHover')<CR>
nmap <leader>k :call CocAction('showSignatureHelp')<CR>

" Expand snippers
imap <C-l> <Plug>(coc-snippets-expand)

" Show and navigate diagnostic info
" (or hover over line for "updatetime", via CursorHold)
nmap <silent> <Leader>d <Plug>(coc-diagnostic-info)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

let g:coc_filetype_map = {
  \ 'pandoc': 'markdown',
  \ }

" Setup formatexpr for the specified filetype(s)
autocmd FileType json,javascript,typescript setlocal formatexpr=CocAction('formatSelected')

" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
