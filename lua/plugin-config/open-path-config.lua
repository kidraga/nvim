-- Open a file path under the cursor (e.g. one printed by Claude Code) in a new tab.
-- Handles "path", "path:12", "path:12:5", "Read(path)", quoted/bracketed paths, and trailing punctuation.

local M = {}

-- Return the token under the cursor (1-based column), or nil.
local function token_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local start = 1
  while true do
    local s, e = line:find("%S+", start)
    if not s then return nil end
    if col >= s and col <= e then
      return line:sub(s, e)
    end
    start = e + 1
  end
end

-- Turn a raw token into (path, line number or nil).
local function parse(tok)
  tok = tok:gsub('^[%(%[{<"\'`]+', '')
  tok = tok:gsub('[%)%]}>"\'`,%.;]+$', '')
  tok = tok:gsub('^%a+%(', '')            -- Claude's "Read(path)" style
  tok = tok:gsub('^[%(%[{<"\'`]+', '')
  local path, lnum = tok:match('^(.-):(%d+):?%d*$')
  if not path then
    path = tok
  end
  return path, tonumber(lnum)
end

-- Find the file, trying the cwd first and then the directory of the current buffer.
local function resolve(path)
  if path == "" then return nil end
  local candidates = { path }
  local buf_dir = vim.fn.expand("%:p:h")
  if buf_dir ~= "" and not path:match("^/") then
    table.insert(candidates, buf_dir .. "/" .. path)
  end
  for _, p in ipairs(candidates) do
    local full = vim.fn.fnamemodify(p, ":p")
    if vim.fn.filereadable(full) == 1 then
      return full
    end
  end
  return nil
end

-- True when the window shows a terminal buffer  (the Claude split).
-- local function is_terminal_win(win)
--   return vim.bo[vim.api.nvim]
-- end

function M.open_under_cursor()
  local tok = token_under_cursor()
  if not tok then
    vim.notify("No path under cursor", vim.log.levels.WARN)
    return
  end
  local path, lnum = parse(tok)
  local full = resolve(path)
  if not full then
    vim.notify("Not a file: " .. path, vim.log.levels.WARN)
    return
  end
  vim.cmd("tabedit " .. vim.fn.fnameescape(full))
  if lnum then
    pcall(vim.api.nvim_win_set_cursor, 0, { lnum, 0 })
  end
end

vim.keymap.set("n", "<leader>o", M.open_under_cursor, { desc = "Open file under cursor in new tab" })
vim.keymap.set("n", "<2-LeftMouse>", function()
  local pos = vim.fn.getmousepos()
  if pos.winid == vim.api.nvim_get_current_win() and pos.line > 0 then
    vim.api.nvim_win_set_cursor(0, { pos.line, math.max(pos.column - 1, 0) })
  end
  M.open_under_cursor()
end, { desc = "Open file under mouse in new tab" })

return M
