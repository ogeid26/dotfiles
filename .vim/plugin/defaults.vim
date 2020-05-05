
" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
	set nocompatible
silent! endwhile

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

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
