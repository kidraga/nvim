vim.cmd([[highlight clear]])
local set_hl = vim.api.nvim_set_hl
vim.o.background='light'
-- italic is not working in tmux by default. https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
vim.cmd([[colorscheme biogoo]])
set_hl(0, 'CursorLineNr', {italic=true, fg='#ffffff', bg='#0000ff', nocombine=true, default=false})
set_hl(0, 'LineNr', {italic=false, fg='#303030', bg='#e5e5e5', nocombine=true, default=false, underline=false})
set_hl(0, 'Type', {fg='#660066', italic=true, bold=false, default=false})
require("themes.common")
-- cursor color may not work. iterm controls it, not highlight group
