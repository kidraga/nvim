local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme oceanic-primal]])
set_hl(0, "NvimTreeExecFile", {fg="#99c794", bold=false})
set_hl(0, "VertSplit", {fg="#6699cc"})
set_hl(0, "GitSignsAdd", {fg="#99c794"})
set_hl(0, "GitSignsChange", {fg="#f99157"})
require("themes.common")
