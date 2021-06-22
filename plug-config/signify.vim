" Don't show number of lines changed.
let g:signify_sign_show_count = 0
" Don't show text indicator like + for new line, ! for modified lines.
let g:signify_sign_show_text = 1

highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
