
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use 'HallerPatrick/nvim_todo.vim'

  use '~/Projects/py_lsp.nvim'
  use 'mbbill/undotree'
  
  -- Linter Engine
  -- use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'nvim-lua/completion-nvim'
  
  -- Visual
  -- use 'itchyny/lightline.vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nathanaelkane/vim-indent-guides'
  use 'ap/vim-buftabline'
  use 'morhetz/gruvbox'
  use 'camspiers/animate.vim'
  use 'camspiers/lens.vim'
  use 'ryanoasis/vim-devicons'
  use 'junegunn/goyo.vim'
  use 'unblevable/quick-scope'
  use 'preservim/tagbar'
  
  -- Utilities
  use 'preservim/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  
  
  use 'airblade/vim-rooter'
  use 'mhinz/vim-startify'
  use 'norcalli/nvim-colorizer.lua'
  use 'chrisbra/unicode.vim'
  use 'AndrewRadev/splitjoin.vim'
  use 'pechorin/any-jump.vim'
  use 'vimwiki/vimwiki'
  
  
  -- Language stuff
  use 'pangloss/vim-javascript'
  use 'mxw/vim-jsx'
  use 'fisadev/vim-isort'
  use 'vim-test/vim-test'
  use 'bfredl/nvim-ipy'
  use 'dart-lang/dart-vim-plugin'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  use 'LukeGoodsell/nextflow-vim'
  use 'jmcantrell/vim-virtualenv'
  
  -- Colortheme
  use 'pineapplegiant/spaceduck'
  use 'relastle/bluewery.vim'
  use '1612492/github.vim'
  use 'https://github.com/wojciechkepka/bogster'
  use 'folke/lsp-colors.nvim'
  use 'rakr/vim-one'

  -- use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  use 'metakirby5/codi.vim'
  use 'lervag/vimtex'
  use 'rhysd/vim-grammarous'
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'junegunn/vim-easy-align'
  
  
  -- Fuzzy Search
  -- use 'junegunn/fzf.vim', { 'do': { -> fzf#install() }}
  use 'junegunn/fzf'
  
  -- Commenting
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-abolish'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'airblade/vim-gitgutter'
  
  
  -- automatic closing of quotes, parenthesis, brackets, etc.
  use 'Raimondi/delimitMate'
  
  -- Vim Script
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/trouble.nvim'
  
  
  use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'
  -- use 'norcalli/snippets.nvim'
  
  use 'folke/which-key.nvim'
  use 'matbme/JABS.nvim'
end)
