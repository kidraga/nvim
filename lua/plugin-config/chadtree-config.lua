-- A temporary workaround to show tree when opeing a folder
vim.cmd([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'CHADopen' | execute 'cd '.argv()[0] | endif
]])
