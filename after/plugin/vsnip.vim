imap <expr> <C-j> '<Plug>(vsnip-expand-or-jump)'
smap <expr> <C-j> '<Plug>(vsnip-expand-or-jump)'

" Jump forward or backward
imap <expr> <Tab>   '<Plug>(vsnip-jump-next)'
smap <expr> <Tab>   '<Plug>(vsnip-jump-next)'
imap <expr> <S-Tab> '<Plug>(vsnip-jump-prev)'
smap <expr> <S-Tab> '<Plug>(vsnip-jump-prev)'

let g:vsnip_filetypes.astro = ['javascript', 'typescript']
let g:vsnip_snippet_dir = fnamemodify($MYVIMRC, ':h') . '/vsnip-snippets'
