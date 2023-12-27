local set_hl = vim.api.nvim_set_hl
vim.o.background = 'dark'
vim.cmd([[colorscheme nordic]])
set_hl(0, "Visual", { link = 'Note', nocombine = true })
