" See help with `:h everforest.txt`
" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" For light version.
" set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'

colorscheme everforest

let g:everforest_sign_column_background = 1
let g:everforest_lightline_disable_bold = 1

" There's corresponding airline theme as well.
