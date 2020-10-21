" Variables
let lengthColumn=80 " Highlight a column as an indicator for max line length
let autoWrapColumn=80 " If autowrap is set, wrap at this column
let rowNumWidth = 8 " Width of the line-number column
let tabsize=2

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugs
call plug#begin('~/.vim/plugs')

  " Support for tens of filetypes
  Plug 'sheerun/vim-polyglot'
  Plug 'arakashic/chromatica.nvim'

  " Ayu Colorscheme
  Plug 'ayu-theme/ayu-vim'

  " Yet another powerline
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " Let's hope I don't go back to NERDTree
  Plug 'tpope/vim-vinegar'

  Plug 'tpope/vim-surround'         " Surround stuff in a flash
  Plug 'tpope/vim-commentary'       " Comment stuff in another flash
  Plug 'tpope/vim-unimpaired'
  Plug 'tommcdo/vim-lion'           " Align stuff in yet another flash
  Plug 'easymotion/vim-easymotion'  " My name is Barry Allen

  " Auto mksession
  Plug 'tpope/vim-obsession'

  " Autocompletion bruddah
  Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer'}

  " Highlight Yanks (Never hurts to have a visual feedback
  Plug 'machakann/vim-highlightedyank'

  " This plugin is unstable and randomly crashes. Find a better alternative
  " Show me de md
  " Plug 'shime/vim-livedown' " `npm install -g livedown` needed
  Plug 'tpope/vim-fugitive'

  " if has('nvim')
  "   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " else
  "   Plug 'Shougo/defx.nvim'
  "   Plug 'roxma/nvim-yarp'
  "   Plug 'roxma/vim-hug-neovim-rpc'
  " endif

  Plug 'preservim/tagbar'

  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'junegunn/fzf', { 'do': {->fzf#install()}}
  Plug 'junegunn/fzf.vim'

  Plug 'Valloric/ListToggle'

  Plug 'ervandew/supertab'

  Plug 'SirVer/ultisnips'

call plug#end()

filetype plugin indent on

" Appearance
  " Editor (isn't the entire thing just an editor?)
  set nowrap
  set nu rnu
  let &numberwidth=rowNumWidth
  set cursorline
  let &colorcolumn=lengthColumn
  set sidescrolloff=5 " The number of screen columns to keep to right and left of cursor
  set scrolloff=5 " The number of screen lines to keep above and below the cursor
  set list
  set lcs+=space:.
  set expandtab
  let &tabstop=tabsize
  let &softtabstop=tabsize
  let &shiftwidth=tabsize
  set shiftround " Round (when shifting lines) to nearest multiple of shiftsize
  set autowrite " Save when switching buffers
  set mouse=a " enable mousemode for the lulz
  set title " set title of terminal to file being edited
  set showtabline=2

  autocmd FileType text let &tw=autoWrapColumn
  autocmd FileType vim let &tw=autoWrapColumn

  " WHILE USEFUL, THIS MAKES BUFFER SWITCHING EXTREMELY SLOW IF DONE FREQUENTLY
  "
  " " N.B: Vim doesn't check periodically, so an external command needs to be
  " " executed for it to check
  " set autoread " Reread files when edited externally
  " " The external command:
  " au FocusGained,BufEnter * :silent! !
  " " Paired with autosave (noautocmd to prevent other hooks from running)
  " au FocusLost,WinLeave * :silent! noautocmd w


  set lazyredraw " Don't redraw when executing macros/scripts

  " Colorscheme Settings
  set termguicolors     " enable true colors support (needed by ayu)
  let ayucolor="dark"   " Dark version of ayu
  colorscheme ayu    " Setting colorscheme
  " hi Normal guibg=NONE ctermbg=NONE

  " Powerline Settings
  set noshowmode
  let g:lightline = {}
  let g:lightline.colorscheme = 'ayu_dark'
  let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }
  let g:lightline.enable = {
        \ 'tabline': 1,
        \ }
  let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
  let g:lightline.component_type = {'buffers': 'tabsel'}
  autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Accessibility
let mapleader = " "

  " For Insert Mode
  imap jk <Esc>

  inoremap (; <CR>(<CR>);<C-c>O
  inoremap (, <CR>(<CR>)<C-c>O
  inoremap {; <CR>{<CR>};<C-c>O
  inoremap {, <CR>{<CR>}<C-c>O
  inoremap [; <CR>[<CR>];<C-c>O
  inoremap [, <CR>[<CR>]<C-c>O

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

" Plugin Settings
    " vim-markdown-preview
    let g:vim_markdown_preview_github=1

    " tagbar
    nmap <F9> :TagbarToggle<CR>

    " " defx
    " nnoremap <silent><buffer><expr> <CR>
    " \ defx#is_directory() ?
    " \ defx#do_action('open_tree', 'recursive:10') :
    " \ defx#do_action('preview')

	  " nnoremap <silent><buffer><expr> o
	  " \ defx#do_action('open_tree', 'toggle')

    " nnoremap <F8> :Defx -split=vertical -winwidth=50 -direction=topleft<CR>
    
  " Completion
  " {
    " ycm
    let g:ycm_always_populate_location_list=1
    " let g:ycm_semantic_triggers = {'c':['re!.']}

    set updatetime=200

    let g:ycm_use_clangd=1
    let g:ycm_auto_trigger=1

    let g:ycm_auto_hover='CursorHold'

    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:ycm_use_ultisnips_completer=1

    let g:ycm_max_num_candidates=7

    nmap <C-i> :YcmCompleter FixIt<CR>

    "supertab
    let g:SuperTabDefaultCompletionType = '<C-n>'

    ""UltiSnips
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


    let g:ycm_autoclose_preview_window_after_insertion=1
  " }
  "
  " " CtrlP
    set wildignore+=*/build/*

nmap <Left> <<
nmap <Right> >>
nmap <Up> [e
nmap <Down> ]e

vmap <Left> <gv
vmap <Right> >gv
vmap <Up> [egv
vmap <Down> ]egv
