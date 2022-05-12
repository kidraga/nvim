-- https://github.com/mfussenegger/nvim-jdtls
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local home = os.getenv('HOME')
local root_dir = require('jdtls.setup').find_root({'packageInfo'}, 'Config')
-- local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local ws_folders_lsp = {}
local ws_folders_jdtls = {}
if root_dir then
  local file = io.open(root_dir .. "/.bemol/ws_root_folders", "r");
  if file then
    for line in file:lines() do
      table.insert(ws_folders_lsp, line);
      table.insert(ws_folders_jdtls, string.format("file://%s", line))
    end
    file:close()
  end
end

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- command to start the jdtls server
    -- refer to https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    '/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/bin/java',
    -- 'java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xmx1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/Library/Java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/Library/Java/jdt-language-server-1.9.0-202203031534/config_mac/',
    '-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir -- $1: put data in your project directory
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  capabilities = capabilities,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    workspaceFolders = ws_folders_jdtls,
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
for _,line in ipairs(ws_folders_lsp) do
    vim.lsp.buf.add_workspace_folder(line)
end

-- Keybindings
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>lA', '<cmd>lua require(\'jdtls\').code_action()<CR>', opts)

