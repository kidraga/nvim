" Documentation: https://github.com/mhinz/vim-signify/blob/master/doc/signify.txt
" Don't show number of lines changed.
let g:signify_sign_show_count = 0
" Don't show text indicator like + for new line, ! for modified lines.
let g:signify_sign_show_text = 1

" sign colors
let g:signify_sign_add = "+"
let g:signify_sign_delete = "_"
let g:signify_sign_delte_first_line = "‾"
let g:signify_sign_change = "~"

highlight SignifySignAdd ctermfg=DarkGreen ctermbg=NONE
highlight SignifySignDelete ctermfg=DarkRed ctermbg=NONE
highlight SignifySignChange ctermfg=DarkCyan ctermbg=NONE
