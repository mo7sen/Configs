" Variables
let lengthColumn=80 " Highlight a column as an indicator for max line length


" Plugs
call plug#begin('~/.config/nvim/plugs')

  " Support for tens of filetypes
  Plug 'sheerun/vim-polyglot'

  " Ayu Colorscheme
  Plug 'ayu-theme/ayu-vim'

  " Yet another powerline
  Plug 'itchyny/lightline.vim'

  " Let's hope I don't go back to NERDTree
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-surround'         " Surround stuff in a flash
  Plug 'tpope/vim-commentary'       " Comment stuff in another flash
  Plug 'tommcdo/vim-lion'           " Align stuff in yet another flash
  Plug 'easymotion/vim-easymotion'  " My name is Barry Allen

  " Auto mksession
  Plug 'tpope/vim-obsession'

  " Autocompletion bruddah
  Plug 'ycm-core/YouCompleteMe'

  " Highlight Yanks (Never hurts to have a visual feedback
  Plug 'machakann/vim-highlightedyank'

  " Show me de md
  Plug 'shime/vim-livedown' " `npm install -g livedown` needed


call plug#end()

" Appearance
  " Editor (isn't the entire thing just an editor?)
  set nowrap
  set nu rnu
  set cursorline
  let &colorcolumn=lengthColumn

  " Colorscheme Settings
  set termguicolors     " enable true colors support (needed by ayu)
  let ayucolor="dark"   " Dark version of ayu
  colorscheme ayu    " Setting colorscheme

  " Powerline Settings
  set noshowmode
  let g:lightline = {
  \ 'colorscheme': 'ayu_dark',
  \ }

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
    nnoremap <M-j> :bn<CR>
    nnoremap <M-k> :bp<CR>

" Functions (I guess)
nnoremap <M-t> :split<CR>
		\<C-w>j 
		\:resize 10<CR>
		\:term<CR>
		\a

tnoremap <M-t> <C-\><C-n>
		\:q<CR>

" Plugin Settings
    " Livedown Preview
    let g:livedown_autorun = 1
