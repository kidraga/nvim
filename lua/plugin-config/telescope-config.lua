-- https://www.bilibili.com/video/BV1P34y1e7SF
local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        layout_config = {
            width = 0.75,
            -- prompt_position = "bottom",
            preview_cutoff = 120, -- if width of window (columns) are less than this, don't show preview
            horizontal = {mirror = false},
            vertical = {mirror = false},
        },
        -- layout_strategy = "bottom_pane",
        find_conmmand = {
            'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
        },
        initial_mode = "insert",
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                -- ["<CR>"] = actions.select_default + actions.center
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["?"] = actions.which_key,
            }
        }
    }
})
