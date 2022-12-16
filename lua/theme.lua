-- https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
vim.cmd([[
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]])
vim.cmd([[
function! HybridOverride() abort
  highlight GitSignsChange ctermfg=143 guifg=#81a2be
  highlight SignColumn guibg=000
  highlight clear Comment
  highlight Comment guifg=#888888
endfunction

augroup HybridCustomize
  autocmd!
  autocmd ColorScheme hybrid call HybridOverride()
augroup end
]])
vim.cmd([[
function! LighthausOverride() abort
  highlight Visual ctermfg=234 ctermbg=20 guifg=#18191E guibg=#1D918B
  highlight Comment ctermfg=100 guifg=#CCCCCC
endfunction

augroup LighthaulsCustomize
  autocmd!
  autocmd ColorScheme hybrid call LighthausOverride()
augroup end
]])
-- vim.cmd([[
-- function! KanagawaOverride() abort
--   highlight CursorLineNr cterm=NONE,italic gui=NONE,italic guifg=#FF9E3B
--   highlight IndentBlankLineContextChar cterm=nocombine gui=nocombine guifg=#b97490
-- endfunction
--
-- augroup KanagawaCustomize
--   autocmd!
--   autocmd ColorScheme kanagawa call KanagawaOverride()
-- augroup end
-- ]])
vim.cmd([[
function! TerafoxOverride() abort
  highlight HopNextKey gui=bold,italic guifg=#ff007c
  highlight HopNextKey1 gui=bold guifg=#00dfff
  highlight HopNextKey2 guifg=#2b8db3
endfunction

augroup TeraCustomize
  autocmd!
  autocmd ColorScheme terafox call TerafoxOverride()
augroup end
]])
-- vim.cmd 'colorscheme kanagawa'
-- vim.cmd 'colorscheme terafox'
-- vim.cmd 'colorscheme elly'

-- local group = vim.api.nvim_create_augroup("CommonThemSettins", { clear = true })

-- local commonThemeSettings = function() 
--   vim.schedule(function()
--     vim.o.background = "dark"
--   end)
-- end
-- vim.api.nvim_create_autocmd("Colorscheme", { 
--   callback = commonThemeSettings
-- })
--
-- local hybridOverride = function()
--   vim.schedule(function()
--     vim.api.nvim_set_hl(0, "GitSignsChange", { fg="#81a2be" })
--     vim.api.nvim_set_hl(0, "SignColumn", { bg="#000000" })
--     vim.api.nvim_set_hl(0, "Comment", { fg="#727169", italic=true })
--   end)
-- end
-- vim.api.nvim_create_autocmd("Colorscheme", {
--   pattern = "hybrid",
--   callback = hybridOverride
-- })
-- vim.cmd 'colorscheme hybrid'
-- vim.cmd 'colorscheme raider'
-- vim.cmd 'colorscheme nightFox'
vim.cmd 'colorscheme kanagawa'

-- vim.cmd([[
-- autocmd InsertEnter * highlight Cursor ctermfg=Green ctermbg=NONE guifg=Green guibg=NONE
-- autocmd InsertEnter * highlight lCursor ctermfg=Green ctermbg=NONE guifg=Green guibg=NONE
-- ]])
-- autocmd InsertLeave * highlight Cursor ctermfg=235 ctermbg=251 guifg=#222222 guibg=#C9C9C9
