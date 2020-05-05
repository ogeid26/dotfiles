let g:ale_enable_on_enter = 0
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier', 'eslint'],
\     'html': ['prettier'],
\     'css': ['prettier']
\}

let g:ale_linters = {
\    'javascript': ['eslint'],
\    'typescript': ['tsserver', 'tslint']
\}

let g:ale_javascript_prettier_options = '--single-quote --trailing-coms es5'

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_fix_on_save = 1
