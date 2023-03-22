require("bufferline").setup{
    -- See all options: https://github.com/akinsho/bufferline.nvim
    options = {
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        middle_mouse_command = "bdelete! %d",          -- can be a string | function, see "Mouse actions"
        separator_style = "thick"
    }
}

-- set key mappings for buffers
vim.cmd([[
    nnoremap <silent><TAB> :BufferLineCycleNext<CR>
    nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]])
