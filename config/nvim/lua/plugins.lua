local utils = require("utils")

vim.cmd([[packadd packer.nvim]])

-- Init plugins
utils.require_plugins({"statusline", "tabline", "refactor", "saga"})

utils.setup_plugins({"which-key", "trouble", "tabout", "Comment", "toggleterm"})

vim.notify = require("notify")

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("HallerPatrick/nvim_todo.vim")

    use("/Users/patrickhaller/Projects/py_lsp.nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use {'glepnir/lspsaga.nvim'}
    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use 'famiu/feline.nvim'

    use("mbbill/undotree")

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
    use("ray-x/lsp_signature.nvim")
    use('stevearc/dressing.nvim')

    use('simrat39/rust-tools.nvim')
    use('chemzqm/vim-jsx-improve')

    -- use('github/copilot.vim')

    use('mfussenegger/nvim-lint')

    use("bfredl/nvim-luadev")
    use("abecodes/tabout.nvim")
    use("sbdchd/neoformat")

    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }
    use {
        "folke/twilight.nvim",
        config = function() require("twilight").setup {} end
    }
    use {
        'chipsenkbeil/distant.nvim',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end
    }
    use("voldikss/vim-floaterm")
    use('puremourning/vimspector')
    use {"akinsho/toggleterm.nvim"}

    -- use("andrejlevkovitch/vim-lua-format")

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('indent_blankline').setup({}) end
    })

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}
        }
    }

    use("kevinhwang91/nvim-hlslens")
    use("akinsho/bufferline.nvim")

    use("nathanaelkane/vim-indent-guides")
    use("camspiers/animate.vim")
    use("camspiers/lens.vim")
    use("ryanoasis/vim-devicons")
    use("junegunn/goyo.vim")
    use("unblevable/quick-scope")
    use("preservim/tagbar")
    use("ap/vim-css-color")

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup {} end
    }

    use("google/vim-maktaba")
    use("google/vim-coverage")

    -- Utilities
    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    })
    use("airblade/vim-rooter")
    use('glepnir/dashboard-nvim')
    use("dstein64/vim-startuptime")
    use("norcalli/nvim-colorizer.lua")
    use("chrisbra/unicode.vim")
    use("AndrewRadev/splitjoin.vim")
    use("pechorin/any-jump.vim")
    use("vimwiki/vimwiki")
    use("jbyuki/venn.nvim")
    use("rcarriga/nvim-notify")

    -- Language stuff
    -- use("pangloss/vim-javascript")
    -- use("mxw/vim-jsx")
    use("vim-test/vim-test")
    -- use("bfredl/nvim-ipy")
    -- use("dart-lang/dart-vim-plugin")
    -- use("natebosch/vim-lsc")
    -- use("natebosch/vim-lsc-dart")

    -- Colortheme
    use("hzchirs/vim-material")
    use("morhetz/gruvbox")
    -- use("pineapplegiant/spaceduck")
    -- use("relastle/bluewery.vim")
    -- use("1612492/github.vim")
    -- use("https://github.com/wojciechkepka/bogster")
    -- use("rakr/vim-one")

    -- Language related stuff
    use("baabelfish/nvim-nim")
    use('ziglang/zig.vim')
    --
    use("folke/lsp-colors.nvim")

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.nvim_exec("mkdp#util#install()") end
    }) -- , { 'do': { -> mkdp#util#install() } }

    -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    use("metakirby5/codi.vim")
    use("lervag/vimtex")
    use("godlygeek/tabular")
    use("plasticboy/vim-markdown")
    use("junegunn/vim-easy-align")
    use("cohama/lexima.vim")

    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    -- use("tpope/vim-commentary")
    use("tpope/vim-surround")
    use("tpope/vim-abolish")
    use("tpope/vim-fugitive")
    use("tpope/vim-eunuch")
    use("airblade/vim-gitgutter")

    -- automatic closing of quotes, parenthesis, brackets, etc.
    use("Raimondi/delimitMate")

    -- Vim Script
    use("kyazdani42/nvim-web-devicons")
    use("folke/trouble.nvim")

    -- use("SirVer/ultisnips")
    -- use('honza/vim-snippets')
    use('hrsh7th/vim-vsnip')
    use('hrsh7th/vim-vsnip-integ')
    -- use 'norcalli/snippets.nvim'

    use("folke/which-key.nvim")
    use("matbme/JABS.nvim")
end)
