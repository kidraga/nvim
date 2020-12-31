" Don't show number of lines changed.
let g:signify_sign_show_count = 0
" Don't show text indicator like + for new line, ! for modified lines.
let g:signify_sign_show_text = 0

" Use color to indicate file update
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
