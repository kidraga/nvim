require("claudecode").setup{
   terminal = {
      provider = "native",
      split_side = "right",
      split_width_percentage = 0.30,
   },
}

local map = vim.keymap.set

map('n', '<leader>ac', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude' })
map('n', '<leader>af', '<cmd>ClaudeCodeFocus<CR>', { desc = 'Focus Claude' })
map('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<CR>', { desc = 'Add current buffer to Claude' })
map('v', '<leader>as', '<cmd>ClaudeCodeSend<CR>', { desc = 'Send selection to Claude' })
map('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<CR>', { desc = 'Accept Claude diff' })
map('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<CR>', { desc = 'Deny Claude diff' })

-- Move between windows from inside the Claude terminal (terminal mode)
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Move to left window' })
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = 'Move to window below' })
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Move to window above' })
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = 'Move to right window' })

-- ZZ: save and close the window; if only the Claude terminal is left, close it too
map('n', 'ZZ', function()
  vim.cmd('x')
  if #vim.api.nvim_list_wins() == 1 and vim.bo.buftype == 'terminal' then
    vim.cmd('q')
  end
end, { desc = 'Save and quit, closing Claude if it is the last window' })
