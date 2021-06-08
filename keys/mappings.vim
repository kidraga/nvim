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

" Easy CAPS
" in insert mode, press ctrl+u to uppercase the whole word
inoremap <c-u> <ESC>viw~i
" in normal mode, press ctrl+u to uppercase the whole word
nnoremap <c-u> viw~

" TAB in general mode will move to next text buffer
" Tried to set as ctrl+TAB but not working since it's reserved for iterm to
" switch tabs
" Same as ctrl+shift+tab
" nnoremap <C-TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
" ctrl+s to save
nnoremap <C-s> :w<CR>
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
