local utils = require("utils")

vim.cmd([[packadd packer.nvim]])

-- Init plugins
utils.require_plugins({"statusline", "tabline", "tscope", "refactor"})

utils.setup_plugins({"which-key", "trouble", "tabout", "Comment", "toggleterm"})

vim.notify = require("notify")

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })

    -- Lsp related
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("onsails/lspkind-nvim")
    use("hrsh7th/nvim-cmp")
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use("lukas-reineke/cmp-rg")
    use("/Users/patrickhaller/Projects/py_lsp.nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("ray-x/lsp_signature.nvim")
    use('stevearc/dressing.nvim')
    use("glepnir/lspsaga.nvim")
    use('simrat39/rust-tools.nvim')
    use("folke/lsp-colors.nvim")
    use("folke/trouble.nvim")
    use({
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    })

    -- Code Style, Refactoring, etc..
    use('mfussenegger/nvim-lint')
    use("sbdchd/neoformat")
    use({
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}
        }
    })

    -- Language specific
    use("bfredl/nvim-luadev")
    use("ap/vim-css-color")
    use("dag/vim-fish")

    use("abecodes/tabout.nvim")

    -- Terminal
    use("akinsho/toggleterm.nvim")

    -- Bufferline
    use("akinsho/bufferline.nvim")

    -- Tabbar
    use("feline-nvim/feline.nvim")

    -- Visuals
    use("nathanaelkane/vim-indent-guides")
    use("camspiers/animate.vim")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")
    use("junegunn/goyo.vim")
    use("norcalli/nvim-colorizer.lua")
    use('glepnir/dashboard-nvim')
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('indent_blankline').setup({}) end
    })
    -- use("khzaw/vim-conceal")
    use("/Users/patrickhaller/Temp/vim-conceal")
    use("rcarriga/nvim-notify")

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }

    -- Utilities
    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    })
    use("airblade/vim-rooter")
    use("dstein64/vim-startuptime")
    use("chrisbra/unicode.vim")
    use("AndrewRadev/splitjoin.vim")
    use("pechorin/any-jump.vim")
    use("unblevable/quick-scope")
    use("preservim/tagbar")
    use("folke/which-key.nvim")
    use("matbme/JABS.nvim")

    -- Minor quality of life improvments
    use("kevinhwang91/nvim-hlslens")
    use("camspiers/lens.vim")

    -- Language stuff
    use("vim-test/vim-test")

    -- Colortheme
    use("morhetz/gruvbox")
    -- use("hzchirs/vim-material")
    -- use("pineapplegiant/spaceduck")
    -- use("relastle/bluewery.vim")
    -- use("1612492/github.vim")
    -- use("rakr/vim-one")

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.nvim_exec("mkdp#util#install()") end
    }) -- , { 'do': { -> mkdp#util#install() } }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- TPope stuff
    use("tpope/vim-surround")
    use("tpope/vim-abolish")
    use("tpope/vim-fugitive")
    use("tpope/vim-eunuch")
    use("airblade/vim-gitgutter")
    use("Raimondi/delimitMate")

    -- Snippet engine
    use("L3MON4D3/LuaSnip")
end)
