local utils = require("utils")

vim.cmd([[packadd packer.nvim]])

-- Init plugins
utils.require_plugins({"statusline", "tabline", "tscope", "refactor"})

utils.setup_plugins({
    "trouble", "tabout", "Comment", "toggleterm", "neoscroll", "texmagic",
    "modes", "nvim-biscuits", "treesitter-context", "jabs"
})

require("which-key").setup({
    plugins = {
        presets = {
            operators = false
        }
    }
})

require("notify").setup({
    background_colour = "#000000"
})

require("nvim_context_vt").setup({
    prefix = "∟"
    -- disable_virtual_lines = true
})

require("luasnip/loaders/from_vscode").lazy_load()

require('nightfox').setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold"
        }
    }
})

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')

    -- Lsp related
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("onsails/lspkind-nvim")
    use("hrsh7th/nvim-cmp")
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use("hrsh7th/cmp-emoji")
    use('hrsh7th/cmp-nvim-lua')
    use("lukas-reineke/cmp-rg")
    use("/Users/patrickhaller/Projects/py_lsp.nvim")
    -- use("HallerPatrick/py_lsp.nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("ray-x/lsp_signature.nvim")
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
    use("daveyarwood/vim-alda")
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
    use('code-biscuits/nvim-biscuits')
    use("karb94/neoscroll.nvim")
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
    use("mvllow/modes.nvim")

    -- use("khzaw/vim-conceal")
    use("/Users/patrickhaller/Temp/vim-conceal")
    use("rcarriga/nvim-notify")
    use {
        'VonHeikemen/searchbox.nvim',
        requires = {{'MunifTanjim/nui.nvim'}}
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }
    use("haringsrob/nvim_context_vt")

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
    use("folke/which-key.nvim")
    use("matbme/JABS.nvim")
    use("skywind3000/asyncrun.vim")

    use("mrjones2014/legendary.nvim")
    use("stevearc/dressing.nvim")

    -- Minor quality of life improvments
    use("kevinhwang91/nvim-hlslens")
    use("camspiers/lens.vim")

    -- Language stuff
    use("vim-test/vim-test")

    -- Colortheme
    use("/Users/patrickhaller/Projects/mosel.nvim")
    use("tjdevries/colorbuddy.nvim")
    use("morhetz/gruvbox")
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        -- tag = '...',
        config = function() vim.cmd('colorscheme rose-pine') end
    })
    use("mrjones2014/lighthaus.nvim")
    use("folke/tokyonight.nvim")
    use "EdenEast/nightfox.nvim"
    -- use("hzchirs/vim-material")
    -- use("pineapplegiant/spaceduck")
    -- use("relastle/bluewery.vim")
    -- use("1612492/github.vim")
    -- use("rakr/vim-one")

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- Latex
    use('lervag/vimtex')
    use('xuhdev/vim-latex-live-preview')
    use({
        'jakewvincent/texmagic.nvim',
        config = function()
            require('texmagic').setup({
                -- Config goes here; leave blank for defaults
            })
        end
    })

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
    use("rafamadriz/friendly-snippets")

    use('lewis6991/impatient.nvim')
end)
