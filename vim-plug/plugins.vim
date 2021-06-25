" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'jacoborus/tender.vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'rakr/vim-one'
    Plug 'w0ng/vim-hybrid'
    Plug 'morhetz/gruvbox'
    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline and Airline themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Lightline and Lightline themes
    " Plug 'itchyny/lightline.vim'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Find project root by .git file
    Plug 'airblade/vim-rooter'

    Plug 'mhinz/vim-startify'

    " Git gutter status
    " Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    " Git integration
    Plug 'tpope/vim-fugitive'

    Plug 'easymotion/vim-easymotion'
    " Floaterm 
    Plug 'voldikss/vim-floaterm'
    " commenter
    Plug 'tpope/vim-commentary'
    " Better search highlight
    Plug 'romainl/vim-cool'
    " Quick search key bindings
    Plug 'liuchengxu/vim-which-key'
call plug#end()
