vim.opt.list = true
local highlight = {
  "Whitespace",
}

require("ibl").setup {
  indent = {
    char = "▏",
    highlight = highlight,
  },
  scope = {
    exclude = { language = { "markdown", "help", "man" } },
    highlight = highlight
  },
}
