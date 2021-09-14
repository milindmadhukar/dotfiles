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
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Ranger
    Plug 'kevinhwang91/rnvimr'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbox Brackets
    Plug 'junegunn/rainbow_parentheses.vim'
    " Starttify
    Plug 'mhinz/vim-startify'
    " Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim' 
    " Plug 'kdheepak/lazygit.nvim'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Quickscope
    Plug 'unblevable/quick-scope'
    " Which Key           
    Plug 'liuchengxu/vim-which-key'
    " Floaterm
    Plug 'voldikss/vim-floaterm'
    " Native Vim LSP and code completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " Golang support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
