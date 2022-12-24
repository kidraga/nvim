-- set leader key to space
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local noreSilentOpt = { noremap=true, silent=true }

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

map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})
-- Better window navigation
-- use ctrl+hjkl to navigate between windows
map('n', '<C-h>', '<C-w>h', noreSilentOpt)
map('n', '<C-j>', '<C-w>j', noreSilentOpt)
map('n', '<C-k>', '<C-w>k', noreSilentOpt)
map('n', '<C-l>', '<C-w>l', noreSilentOpt)

-- Y yank to the end of the line
-- By default Y yank the whole line, which is the same as yy
map('n', 'Y', 'y$', {noremap = true})

-- Keep cursor centered
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})

-- Quick save
map('n', 'FF', ':update<CR>', {noremap = true})

map('i', 'kj', '<ESC>', {noremap = true})

-- Nvim tree toggle
map('n', '<C-n>', ':NvimTreeToggle<CR>', noreSilentOpt)

-- Telescope
local cwd = vim.fn['getcwd']()
map('n', '<C-f>', string.format(':lua require("telescope.builtin").find_files({cwd = "%s"})<CR>', cwd), {noremap = true})
map('n', '<leader>r', string.format(':lua require("telescope.builtin").live_grep({cwd = "%s"})<CR>', cwd), noreSilentOpt)
map('n', '<leader>u', ':Telescope reuse<CR>', {noremap = true}) -- get back to previous search
map('n', '<leader>b', ':Telescope buffers<CR>', {noremap = true})

-- Comment
map('n', '<C-_>', ':CommentToggle<CR>', {noremap = true})
map('v', '<C-_>', ":'<,'>CommentToggle<CR>", {noremap = true})

-- Close buffer
map('n', '<leader>x', ':bp|bd #<CR>', noreSilentOpt)

-- hop
map('n', '<leader><leader>w', ':HopWord<CR>', noreSilentOpt)

-- Open CHADTree
-- map('n', '<C-n>', ':CHADopen<CR>', {noremap = true, silent = true})

-- LSP
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', noreSilentOpt) -- using treesitter. see treesitter.lua
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', noreSilentOpt)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', noreSilentOpt)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', noreSilentOpt)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', noreSilentOpt)

-- replace word
map('n', 'rw', 'ciw<C-r>0<Esc>', noreSilentOpt) -- ctrl+r in insert mode is paste, following a register
