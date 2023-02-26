local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme habamax]])

set_hl(0, "@variable", {fg="#bcbcbc"})
set_hl(0, "NvimTreeExecFile", {fg="#afd7af", bold=false})
set_hl(0, "GitSignsUntrackedLn", {fg="#87af87"})
set_hl(0, "DiffAdd", {fg="#87af87"})
set_hl(0, "DiffChange", {fg="#d7875f"})
set_hl(0, "CursorLineNr", {bold=false, italic=true, nocombine=false})
require("themes.common")
