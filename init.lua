-- Marker file (not tracked in this repo) that only exists on my own laptop.
-- Create it manually with: touch ~/.local/share/nvim/is_own_laptop
vim.g.is_own_laptop = vim.uv.fs_stat(vim.fn.stdpath('data') .. '/is_own_laptop') ~= nil

-- load plugins
require('plugins')
-- load keybindings
require('keybindings')
-- load plugin configs
require('plugin-config')

require('lsp')

-- load settings
require('settings')

-- load default theme
local color_picker = require('picker')
color_picker.load_local_theme()
