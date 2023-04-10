vim.o.syntax = "enable" --Enables syntax highlighing
vim.o.hidden = true --Required to keep multiple buffers open multiple buffers
vim.o.wrap = true --Display long lines as just one line
vim.o.sidescroll = 20 -- How many columns to pop in each scroll.
vim.o.scrolloff = 10 -- Keep 10 lines below and above the cursor
vim.o.encoding = "utf-8" --The encoding displayed
-- vim.o.pumheight=10                        --Makes popup menu smaller
vim.o.fileencoding = "utf-8" --The encoding written to file
vim.o.ruler = true --Show the cursor position all the time
vim.o.cmdheight = 2 --More space for displaying messages
-- vim.o.iskeyword+=-                      	--treat dash separated words as a word text object"
vim.o.mouse = "a" --Enable your mouse
vim.o.splitbelow = true --Horizontal splits will automatically be below
vim.o.splitright = true --Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" --Support 256 colors
vim.o.conceallevel = 0 --So that I can see `` in markdown files
vim.o.tabstop = 2 --Insert 2 spaces for a tab
vim.o.shiftwidth = 2 --Change the number of space characters inserted for indentation
vim.o.smarttab = true --Makes tabbing smarter will realize you have 2 vs 4
vim.o.smartcase = true --Combined with ignorecase for better search
vim.o.ignorecase = true --Only do case sensitive search when typed Uppercase letter
vim.o.expandtab = true --Converts tabs to spaces
vim.o.smartindent = true --Makes indenting smart
vim.o.autoindent = true --Good auto indent
-- vim.o.laststatus = 0 --Always display the status line. Will override many statusline plugins silently.
vim.o.number = true --Line numbers
vim.o.cursorline = true --Enable highlighting of the current line
-- vim.o.background=dark                     --tell vim what the background color looks like
vim.o.showtabline = 2 --Always show tabs on top
vim.o.showmode = false --We don't need to see things like -- INSERT -- anymore
vim.o.backup = false --Don't create backup file
vim.o.writebackup = false --Don't write backup file
vim.o.updatetime = 100 --Faster completion
vim.o.timeoutlen=500 --By default timeoutlen is 1000 ms
vim.o.ttimeoutlen=100 --By default ttimeoutlen is 50 ms
vim.o.signcolumn = "yes" --Sign column for git signs
-- vim.o.formatoptions-=cro                  --Stop newline continution of comments. This is not working since other plugins will override this
-- au FileType * setlocal fo-=c fo-=r fo-=o --Same as above
vim.o.clipboard = "unnamedplus" --Copy paste between vim and everything else. Yank in vim and cmd+v to paste
vim.o.autochdir = true --Your working directory will always be the same as your working directory
vim.o.termguicolors = true
-- vim.o.guicursor="n-v-c-sm:block-Cursor,i-ci-ve:hor20-Cursor,r-cr-o:hor20" -- see :h 'guicursor'
vim.cmd([[au VimLeave,VimSuspend * set guicursor=a:hor20]]) -- reset cursor style after quitting. Neovim will override cursor style.
-- https://github.com/neovim/neovim/wiki/FAQ#cursor-style-isnt-restored-after-exiting-or-suspending-and-resuming-nvim

-- for nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- au! BufWritePost $MYVIMRC source %      --auto source when writing to init.vm alternatively you can run :source $MYVIMRC

-- --You can't stop me
-- cmap w!! w !sudo tee %

vim.api.nvim_create_user_command('Themes', 'luafile ~/.config/nvim/lua/picker/init.lua', {})
