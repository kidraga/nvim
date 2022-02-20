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

function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
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

local colorschemes = vim.fn.getcompletion("", "color")

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

local dropdown = themes.get_dropdown()
-- local ivy = themes.get_ivy()
local cursor = themes.get_cursor()

local colors = pickers.new(mini, opts)


-- run the picker
colors:find()

-- print(vim.inspect(dropdown))
