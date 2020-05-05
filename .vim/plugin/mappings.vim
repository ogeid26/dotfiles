" Key Mappings

let g:gruvbox_guisp_fallback = "bg"

" Jump between splits 
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

map <leader>g :Goyo \| set linebreak<CR>
vmap <C-c> "+y 
nnoremap <leader>h :set hlsearch! hlsearch? <CR>
nnoremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F8> :setl noai nocin nosi inde=<CR>
map  <C-n> :bn<CR>
map  <C-p> :bp<CR>
map <leader>x :Bclose<CR>
map  <leader>c :tabnew<CR>
nmap <leader><leader> <C-^>
nnoremap <space> za

" Quickfix
noremap <localleader>w :lclose <CR> 
noremap <localleader>q :lopen <CR> 

" Go to start/end of line while in Insert Mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
