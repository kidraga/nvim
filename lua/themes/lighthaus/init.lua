local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme lighthaus]])
-- vim.cmd([[
-- highlight Visual ctermfg=234 ctermbg=20 guifg=#18191E guibg=#1D918B
-- highlight Comment ctermfg=100 guifg=#CCCCCC
-- ]])
set_hl(0, 'Visual', {fg='#18191E', bg='#1D918B'})
set_hl(0, 'Comment', {fg='#999999', italic=true})
set_hl(0, 'Directory', {fg='#1d918b', bold=true})
require("themes.common")
