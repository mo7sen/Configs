" WHILE USEFUL, THIS MAKES BUFFER SWITCHING EXTREMELY SLOW IF DONE FREQUENTLY
"
" " N.B: Vim doesn't check periodically, so an external command needs to be
" " executed for it to check
" set autoread " Reread files when edited externally
" " The external command:
" au FocusGained,BufEnter * :silent! !
" " Paired with autosave (noautocmd to prevent other hooks from running)
" au FocusLost,WinLeave * :silent! noautocmd w
