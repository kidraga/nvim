require("claudecode").setup{
   terminal = {
      provider = "native",
      split_side = "right",
      split_width_percentage = 0.40,
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

-- Scroll Claude's message list from normal or terminal mode, without leaving the current mode.
-- Claude scrolls its own history on mouse-wheel events, so we send the same SGR wheel sequences
-- the mouse would send to the terminal's job. Only works in terminal buffers (channel is 0 elsewhere).
local WHEEL_LINES = 5 -- wheel events per key press

local function claude_wheel(direction)
  local channel = vim.bo.channel
  if channel == 0 then return end
  local button = direction == 'up' and 64 or 65
  -- Position the event in the middle of the window so it lands in the message area
  local row = math.max(1, math.floor(vim.api.nvim_win_get_height(0) / 2))
  local col = math.max(1, math.floor(vim.api.nvim_win_get_width(0) / 2))
  local event = string.format('\27[<%d;%d;%dM', button, col, row)
  vim.api.nvim_chan_send(channel, string.rep(event, WHEEL_LINES))
end

map({ 'n', 't' }, '<M-n>', function() claude_wheel('up') end, { desc = 'Scroll Claude up' })
map({ 'n', 't' }, '<M-m>', function() claude_wheel('down') end, { desc = 'Scroll Claude down' })
