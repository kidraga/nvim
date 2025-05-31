vim.g.completeopt="menu,menuone,noinsert"
-- Some helper functions
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Load required modules
local lspkind = require('lspkind')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
-- Import luasnip
local import_luasnip, luasnip = pcall(require, 'luaSnip')
if not import_luasnip then return end

-- Setup mason for automatic LSP serlatiover installation
local mason_ok, mason = pcall(require, 'mason')
if mason_ok then
  mason.setup()

  local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if mason_lspconfig_ok then
    mason_lspconfig.setup({
      ensure_installed = {'tsserver'},
      automatic_installation = true,
    })
  end
end

-- LSP capabilities for nvim-cmp
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()


-- lsp keybindings
local on_attach = function(client, bufnr)
  -- https://github.com/neovim/nvim-lspconfig
    -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- check treesitter.lua
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
  -- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
  vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
end

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Show a floating window for diagnostics
-- https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})

-- CMP configuration
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })
    })
  }
})

-- Use buffer text for completion when searching with '/'
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  }),
})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  float = {
    source = "always",
  },
})

-- -- Diagnostic signs
--
local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end
