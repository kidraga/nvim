" enable tabs on top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_modified = 1
let g:airline_symbols_ascii = 1

" Switch to your current theme
let g:airline_theme = 'hybridline'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" This is to stop show the vim -- INSERT --, not Airline one
set noshowmode
