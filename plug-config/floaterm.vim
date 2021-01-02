
" Set terminal to non floating and at bottom
let g:floaterm_wintype = 'normal'
let g:floaterm_position = 'bottom'

let g:floaterm_height = 0.3

let g:floaterm_keymap_new = '<F7>'
let g:floaterm_keymap_prev = '<F8>'
let g:floaterm_keymap_next = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" let g:floaterm_keymap_hide = ''
" let g:floaterm_keymap_show = ''

" Disable line number in terminal
autocmd TermOpen * setlocal nonu
