-- set leader key to space
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Use ctrl + shift + hjkl to resize windows
-- cannot use alt + hjkl since mac os reservice alt+character for special
-- characters
-- cannot use ctrl + arrow since mac os reservice that for window navigation
-- map('n', '<C-S-j>', ':resize -2<CR>', {noremap = true})
-- map('n', '<C-S-k>', ':resize +2<CR>', {noremap = true})
-- map('n', '<C-S-h>', ':vertical resize -2<CR>', {noremap = true})
-- map('n', '<C-S-l>', ':vertical resize +2<CR>', {noremap = true})

-- Better tabbing
-- Not losing selections after tabbing
map('v', '<', '<gv', {noremap = true})
map('v', '>', '>gv', {noremap = true})

-- Better window navigation
-- use ctrl+hjkl to navigate between windows
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Y yank to the end of the line
-- By default Y yank the whole line, which is the same as yy
map('n', 'Y', 'y$', {noremap = true})

-- Keep cursor centered
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})

-- Quick save
map('n', 'FF', ':update<CR>', {noremap = true})

map('i', 'jk', '<ESC>', {noremap = true})
map('i', 'kj', '<ESC>', {noremap = true})

-- Nvim tree toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Telescope
map('n', '<C-f>', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>r', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>u', ':Telescope reuse<CR>', {noremap = true}) -- get back to previous search
map('n', '<leader>b', ':Telescope buffers<CR>', {noremap = true})

-- Comment
vim.api.nvim_set_keymap('n', '<C-_>', ':CommentToggle<CR>', {noremap = true}) -- <C-_> is ctrl+/ in vim
vim.api.nvim_set_keymap('v', '<C-_>', ":'<,'>CommentToggle<CR>", {noremap = true})

-- Close buffer
map('n', '<leader>x', ':bp|bd #<CR>', {noremap = true, silent = true})

-- hop
map('n', '<leader><leader>w', ':HopWord<CR>', {noremap = true, silent = true})

-- Open CHADTree
-- map('n', '<C-n>', ':CHADopen<CR>', {noremap = true, silent = true})

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})


