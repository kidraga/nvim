local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme nordfox]])
set_hl(0, "CursorLineNr", {bold=false, fg='#ebcb8b', italic=true, nocombine=true})
require("themes.common")
