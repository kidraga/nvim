vim.cmd('autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>')
-- there are some defaults for image directory and image name, you can change them
-- vim.o somehow not working
vim.cmd("let g:mdip_imgdir = 'img'")
vim.cmd("let g:mdip_imgname = 'image'")
