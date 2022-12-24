local actions = require("telescope.actions") -- picker object that will show us the prompt
local action_state = require("telescope.actions.state") -- picker object that will show us the prompt
local pickers = require("telescope.pickers") -- picker object that will show us the prompt
local finders = require("telescope.finders") -- finder will provide input for picker
local sorters = require("telescope.sorters") -- finder will provide input for picker
local themes = require("telescope.themes") -- finder will provide input for picker

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

function config_exists(name)
  local pwd = os.getenv("PWD")
  local potential_scheme_config = pwd .. '/lua/themes/' .. name .. '/init.lua'
  local f = io.open(potential_scheme_config, "r")
  if f~=nil then io.close(f) return true else return false end
end

function set_color()
  local selected = action_state.get_selected_entry()
  local scheme_name = selected[1]
  if config_exists(scheme_name) then
    print("Found config file for " .. scheme_name)
    require('../themes/' .. scheme_name)
  else
    print("No config found")
    vim.cmd('colorscheme ' .. scheme_name)
  end
end

function enter(prompt_bufnr)
  set_color()
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

local bad_colorschemes = { -- all default themes
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


-- run the picker
colors:find()

-- print(vim.inspect(dropdown))
