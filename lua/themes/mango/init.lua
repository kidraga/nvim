local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[highlight clear]])
vim.cmd([[colorscheme mango]])
set_hl(0, 'Directory', {fg='#1d918b', bold=true})
set_hl(0, 'NonText', {fg='#373c45'})
set_hl(0, 'DiffAdd', {fg='#44b273'})
set_hl(0, 'DiffChange', {fg='#ffaf00'})
set_hl(0, 'Pmenu', {bg='#21252d'})
set_hl(0, 'IndentBlankLineChar', {fg='#585858'})
require("themes.common")
