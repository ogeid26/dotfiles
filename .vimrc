set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/zsh
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Aesthetics
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dylanaraps/wal.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'rafi/awesome-vim-colorschemes'

" Writing
Plugin 'lervag/vimtex'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'prurigro/vim-markdown-concealed'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'terryma/vim-smooth-scroll'

"Development
Plugin 'sheerun/vim-polyglot'

" Finding/completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Tools
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-liquid'


" Nice Icons
Plugin 'ryanoasis/vim-devicons' " Must be last

call vundle#end()            " required
filetype plugin indent on    " required



if exists('skip_defaults_vim')
  finish
endif

set mouse=a


" Vim
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

map Q gq

  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
" Only do this part when Vim was compiled with the +eval feature.
if 1

  " put these in an autocmd group, so that you can revert them with:
  " ":augroup vimstartup | au! | augroup end"
  augroup vimstartup
    au!

      autocmd bufreadpost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup end

endif

" convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" only define it when not defined already.
" revert with: ":delcommand difforig".
"
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " prevent that the langmap option applies to characters that result from a
  " mapping.  if set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif



aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
" ~~~~~~~~~~~~


" Keeping folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" Enable folding
set foldmethod=syntax
set foldlevel=99

nnoremap <space> za

" Folds by manual and by indent level
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

let mapleader = ","
let g:airline_powerline_fonts = 1
set encoding=utf8
set background=dark
set t_Co=256
syntax enable
set hidden
set number relativenumber

let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox

" Jump between splits 
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" Clipboard hacking
set clipboard=unnamedplus

" Luke Smith's shortcuts
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

aug i3config_ft_detection " Setting up i3 syntax highlighting
	au!
	au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Markdown file recognition
au BufNewFile,BufFilePre,BufRead *.md setf markdown

" Indenting
set tabstop=4
set expandtab


let g:bclose_multiple = 0
" All things git
set diffopt+=vertical
" ========================================

" ULTISNIPS (WORKS WITH YCM)	
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" =========================================

" VIMTEX
filetype plugin indent on
syntax on
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
setlocal conceallevel=2
let g:tex_conceal='abdmg'
" =========================================


" VIM AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts= 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" =========================================


" NERDTREE
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable autocommenting

"Close automatically if only open NERDTree.
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

" NERDTREE-GIT

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" ==========================================================

" KEYBINDINGS 
map <leader>g :Goyo \| set linebreak<CR>
vmap <C-c> "+y 
map <leader>t :NERDTreeToggle<CR>
map <leader>1 :NERDTreeFocus<CR>
nnoremap <leader>h :set hlsearch! hlsearch? <CR>
nnoremap <F8> :setl noai nocin nosi inde=<CR>
map  <C-n> :bn<CR>
map  <C-p> :bp<CR>
map <leader>x :Bclose<CR>
map  <leader>c :tabnew<CR>
nmap <leader><leader> <C-^>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" inoremap { {<CR>}<Esc>
" =================================================

" VIM MARKDOWN
let g:vim_markdown_folding = 2
set foldcolumn=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" ===================================================

"VIM MARKDOWN PREVIEW
let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_browser = 'firefox'

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <leader>p <Plug>MarkdownPreviewToggle

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_show_diagnostics_ui = 0
" ===================================================


" PYTHON
let g:python_highlight_all = 1

" JAVA
let g:syntastic_java_checkers = []

