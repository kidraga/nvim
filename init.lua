-- load plugins
require('plugins')
-- load keybindings
require('keybindings')
-- load plugin configs
require('plugin-config')

require('lsp')

-- load settings
require('settings')

-- set color scheme
vim.o.background = "dark"
require('theme')
-- vim.cmd('colorscheme hybrid')
