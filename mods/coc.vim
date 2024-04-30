inoremap <silent> <c-r> <C-r>=CocActionAsync('showSignatureHelp')<CR>

let g:coc_snippet_next = '<a-i>'
let g:coc_snippet_prev = '<a-o>'

inoremap <expr> <c-n> coc#pum#visible() ? coc#pum#next(0) : "\<c-n>"
inoremap <expr> <c-i> coc#pum#visible() ? coc#pum#next(0) : "\<c-i>"
inoremap <expr> <c-p> coc#pum#visible() ? coc#pum#prev(0) : "<c-p>"
inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<c-j>"
inoremap <silent><expr> <c-n> coc#refresh()

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> dj <Plug>(coc-definition)
nmap <silent> dy <Plug>(coc-type-definition)
nmap <silent> di <Plug>(coc-implementation)
nmap <silent> dr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
