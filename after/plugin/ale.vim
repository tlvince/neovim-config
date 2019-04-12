let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linter_aliases = {'pandoc': ['markdown']}
let g:ale_pattern_options = {'\.js$': {'ale_enabled': 0}}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" Fix base16-eighties cterm backgrounds
highlight ALEErrorSign ctermfg=1 ctermbg=0
highlight ALEWarningSign ctermfg=3 ctermbg=0
