let g:prettiere#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'fasle'

" This one's for modifying every time i get out of Insert Mode
" let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
