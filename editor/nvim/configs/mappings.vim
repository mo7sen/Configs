" Accessibility
let mapleader = " "

  " For Insert Mode
  imap jk <Esc>

  " For Terminal Mode
  tnoremap jk  <C-\><C-n> 
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " For Normal Mode
  nnoremap ; :
  nnoremap ,/ :noh<CR>

  " Pane Movement
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Splits
  nnoremap <M-v> :vsplit<CR>
  nnoremap <M-h> :split<CR>

  " Buffer Switching
  nnoremap <leader>j :bn<CR>
  nnoremap <leader>k :bp<CR>
  nnoremap <leader>; :bd<CR>

" Functions (I guess)
nnoremap <C-t> :split<CR>
    \<C-w>j 
    \:res 10<CR>
    \:term<CR>
    \a

nnoremap <M-t> <C-w>j 
    \:res 10<CR>
    \a

tnoremap <M-t> <C-\><C-n>
    \:res 0<CR>
    \<C-w>k
