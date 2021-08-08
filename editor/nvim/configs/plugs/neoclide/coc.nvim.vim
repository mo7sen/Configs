" TODO: Find a way to choose a specific branch
" TODO: Make sure it is the 'release' branch

set updatetime=300
set cmdheight=1

set signcolumn=number
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format-selected)


