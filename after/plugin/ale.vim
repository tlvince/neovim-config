let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linter_aliases = {'pandoc': ['markdown']}
let g:ale_pattern_options = {
\ '\.js$': {'ale_enabled': 0},
\ '\.ts$': {'ale_enabled': 0},
\ '\.tsx$': {'ale_enabled': 0}
\}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
