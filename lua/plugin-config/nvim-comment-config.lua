require('nvim_comment').setup({
  -- Doesn't support mapping to same key: https://github.com/terrortylor/nvim-comment/issues/38
  -- Use our own keybinding instead
  -- line_mapping = "<C-/>",
  -- operator_mapping = "<C-/>",
  --
  -- https://github.com/terrortylor/nvim-comment
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  -- we are using our own keybinding. check keybindings.lua
  create_mappings = false,
})
