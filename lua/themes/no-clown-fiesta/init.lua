local set_hl = vim.api.nvim_set_hl
vim.o.background='dark'
vim.cmd([[colorscheme no-clown-fiesta]])
-- set_hl(0, "@type", {fg="#e1e1e1", bold=false})
set_hl(0, "@type", {fg="#a1a1a1", bold=false})
set_hl(0, "@type.qualifier", {fg="#a1a1a1", italic=true})
set_hl(0, "@type.builtin", {fg="#a1a1a1", italic=true})
set_hl(0, "@keyword", {fg="#e1e1e1", italic=true})
set_hl(0, "@keyword.return", {fg="#7e97ab"})
