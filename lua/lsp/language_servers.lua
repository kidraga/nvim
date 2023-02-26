local lsp_installer = require('mason')
lsp_installer.setup()

-- lsp_installer.on_server_ready(function(server)
-- --  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
-- --                                                                       .make_client_capabilities())
--   local opts = {
--     on_attach = require("lsp.keybindings").add_key_bindings_on_attach,
-- --    capabilities = capabilities
--   }
--   if server.name == "sumneko_lua" then
--     opts = vim.tbl_deep_extend("force", {
--       settings = {
--         Lua = {
--           runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
--           diagnostics = {globals = {'vim'}},
--           workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
--           telemetry = {enable = false}
--         }
--       }
-- 
--     }, opts)
--   end
--   server:setup(opts)
-- end)
