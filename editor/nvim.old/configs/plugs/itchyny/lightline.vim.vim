set noshowmode

let g:lightline = {}

" TODO: Test presence of colorscheme
let g:lightline.colorscheme = 'ayu_dark'

let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }

let g:lightline.enable = {
      \ 'tabline': 1,
      \ }

" TODO: Test existence of bufferline plugin
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
