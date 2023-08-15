local actions = require("telescope.actions")            -- picker object that will show us the prompt
local action_state = require("telescope.actions.state") -- picker object that will show us the prompt
local pickers = require("telescope.pickers")            -- picker object that will show us the prompt
local finders = require("telescope.finders")            -- finder will provide input for picker
local sorters = require("telescope.sorters")            -- finder will provide input for picker
local themes = require("telescope.themes")              -- finder will provide input for picker

-- local map = vim.api.nvim_set_keymap
local mini = {
  layout_strategy = "vertical",
  layout_config = {
    height = 0.5,
    width = 0.3,
    prompt_position = "top",
  },
  sorting_strategy = "ascending",
}

local home = os.getenv("HOME")
local local_theme = home .. '/.config/nvim/theme.txt'
local default_theme = 'no-clown-fiesta'

-- check if customize config exist
function config_exists(name)
  local potential_scheme_config = home .. '/.config/nvim/lua/themes/' .. name .. '/init.lua'
  local f = io.open(potential_scheme_config, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function set_color(theme_name)
  if config_exists(theme_name) then
    print("Found config file for " .. theme_name)
    require('../themes/' .. theme_name)
  else
    print("No config found")
    vim.cmd('colorscheme ' .. theme_name)
  end
end

function set_local_theme(theme_name)
  local f = io.open(local_theme, "w")
  if f ~= nil then
    f:write(theme_name .. "\n")
    print("Updated local theme file")
    f:close()
  else
    print("No local theme file found.")
  end
end

function load_local_theme(verbose)
  local verbose = verbose or true
  local f = io.open(local_theme, "r")
  local theme_to_load = default_theme
  if f ~= nil then
    local theme_name = f:read()
    f:close()
    theme_to_load = theme_name
    if verbose then
      print("Found theme from local: " .. theme_name)
    end
  else
    if verbose then
      print("No local theme file found.")
    end
  end
  set_color(theme_to_load)
end

function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local theme_name = selected[1]
  set_color(theme_name)
  set_local_theme(theme_name)
  actions.close(prompt_bufnr)
end

function next_color(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
end

function prev_color(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
end

local bad_colorschemes = {
  -- all default themes
  ['apprentice'] = true,
  ['blue'] = true,
  ['darkblue'] = true,
  ['default'] = true,
  ['delek'] = true,
  ['desert'] = true,
  ['elflord'] = true,
  ['evening'] = true,
  ['industry'] = true,
  ['koehler'] = true,
  ['lucius'] = true,
  ['lunaperche'] = true,
  ['morning'] = true,
  ['murphy'] = true,
  ['pablo'] = true,
  ['peachpuff'] = true,
  ['quiet'] = true,
  ['ron'] = true,
  ['shine'] = true,
  ['slate'] = true,
  ['torte'] = true,
  ['zellner'] = true,
}
local all_colorschemes = vim.fn.getcompletion("", "color")
local colorschemes = {}
for _, v in ipairs(all_colorschemes) do
  if not bad_colorschemes[v] then
    table.insert(colorschemes, v)
  end
end

local opts = {
  finder = finders.new_table(colorschemes),
  sorter = sorters.get_generic_fuzzy_sorter({}),
  attach_mappings = function(prompt_bufnr, map)
    map('i', '<CR>', enter)
    map('i', '<C-j>', next_color)
    map('i', '<C-k>', prev_color)

    map('n', '<CR>', enter)
    map('n', 'j', next_color)
    map('n', 'k', prev_color)
    return true
  end,
}

-- local dropdown = themes.get_dropdown()
-- local ivy = themes.get_ivy()
local cursor = themes.get_cursor()

local colors = pickers.new(mini, opts)

local M = {}
function M.run_color_picker()
  colors:find()
end

function M.load_local_theme()
  load_local_theme(false)
end

return M
