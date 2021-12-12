" Key mapping for Neo Vim
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use ctrl + shift + hjkl to resize windows
" cannot use alt + hjkl since mac os reservice alt+character for special
" characters
" cannot use ctrl + arrow since mac os reservice that for window navigation
nnoremap <C-S-j>    :resize -2<CR>
nnoremap <C-S-k>    :resize +2<CR>
nnoremap <C-S-h>    :vertical resize -2<CR>
nnoremap <C-S-l>    :vertical resize +2<CR>

" TAB in general mode will move to next text buffer
" Tried to set as ctrl+TAB but not working since it's reserved for iterm to
" switch tabs
" Same as ctrl+shift+tab
" nnoremap <leader><TAB> :bnext<CR>
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
" Not losing seletions after tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
" use ctrl+hjkl to navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close buffer and return to previous buffer without closing split
nnoremap <leader>bd :bp\|bd #<CR>

" Y yank to the end of the line
" By default Y yank the whole line, which is the same as yy
nnoremap Y y$

" Keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo won't delete whole line, but will stop at below sign.
" Add any sign you like.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Quick save
nnoremap FF :update<CR>

inoremap jk <ESC>
inoremap kj <ESC>

