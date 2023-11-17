-- global variables must be set before call require'nvim-tree'
vim.g.nvim_tree_git_hl = 0         -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics         = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },
  filters             = {
    dotfiles = false,
    custom = {}
  },
  git                 = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view                = {
    width = 30,
    side = 'left',
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash               = {
    cmd = "trash",
    require_confirm = true
  }
}
