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
