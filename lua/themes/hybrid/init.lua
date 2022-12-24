vim.cmd([[colorscheme hybrid]])
vim.cmd([[
highlight GitSignsChange ctermfg=143 guifg=#81a2be
highlight SignColumn guibg=000
highlight clear Comment
highlight Comment guifg=#888888
]])

-- vim.cmd([[
-- function! HybridOverride() abort
--   highlight GitSignsChange ctermfg=143 guifg=#81a2be
--   highlight SignColumn guibg=000
--   highlight clear Comment
--   highlight Comment guifg=#888888
-- endfunction
--
-- augroup HybridCustomize
--   autocmd!
--   autocmd ColorScheme hybrid call HybridOverride()
-- augroup end
-- ]])
