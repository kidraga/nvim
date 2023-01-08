local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme hybrid]])
set_hl(0, 'GitSignsChange', {fg='#81a2be', default=false})
set_hl(0, 'DiffAdd', {fg='#d7ffaf', default=false})
set_hl(0, 'SignColumn', {bg='NONE', default=false})
set_hl(0, 'Comment', {fg='#888888', italic=true, default=false})
require("themes.common")
