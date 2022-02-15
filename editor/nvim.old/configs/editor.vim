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
" set lcs+=space:.
set expandtab " Insert spaces instead of tabs
let &tabstop=tabsize " Tab width
let &softtabstop=tabsize
let &shiftwidth=tabsize
set shiftround " Round (when shifting lines) to nearest multiple of shiftsize
set autowrite " Save when switching buffers
set mouse=a " enable mousemode for the lulz
set title " set title of terminal to file being edited
set showtabline=2
set lazyredraw " Don't redraw when executing macros/scripts

autocmd FileType text let &tw=autoWrapColumn
autocmd FileType vim let &tw=autoWrapColumn

set termguicolors     " enable true colors support (needed by ayu)
colorscheme ayu    " Setting colorscheme
hi Normal guibg=NONE ctermbg=NONE

filetype plugin indent on
