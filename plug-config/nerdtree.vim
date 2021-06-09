" Toggle nerd tree
nmap <leader>nt :NERDTreeToggle<CR>

" Quit vim when nerd tree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDtree") && b:NERDtree.isTabTree.isTabTree()) | q | endif

" Change arrow symbol before folders to + and - signs
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
