local utils = require("utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "karoliskoncevicius/sacredforest-vim", {
        "nvim-treesitter/nvim-treesitter",
        build = "TSUpdate"
    }, 'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/playground',

    -- Lsp related
    "neovim/nvim-lspconfig", {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    }, "williamboman/mason-lspconfig.nvim", "onsails/lspkind-nvim",
    "hrsh7th/nvim-cmp", 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path', "hrsh7th/cmp-emoji", 'hrsh7th/cmp-nvim-lua',
    "lukas-reineke/cmp-rg", {
        "/Users/patrickhaller/Projects/py_lsp.nvim",
        dev = true
    }, -- use {
    --   "HallerPatrick/py_lsp.nvim", tag="v0.0.1"
    -- }
    "nvim-lua/lsp_extensions.nvim", "ray-x/lsp_signature.nvim",
    "glepnir/lspsaga.nvim", 'simrat39/rust-tools.nvim', "folke/lsp-colors.nvim",
    "folke/trouble.nvim", {
        "SmiteshP/nvim-gps",
        dependencies = "nvim-treesitter/nvim-treesitter"
    }, -- Code Style, Refactoring, etc..
    -- "mfussenegger/nvim-lint",
    "sbdchd/neoformat", -- Language specific
    "stsewd/isort.nvim",
    "daveyarwood/vim-alda", "bfredl/nvim-luadev", "ap/vim-css-color",
    "dag/vim-fish", "abecodes/tabout.nvim", -- Terminal
    "akinsho/toggleterm.nvim", -- Bufferline
    "akinsho/bufferline.nvim", {
        "petertriho/nvim-scrollbar",
        config = function(_) require("scrollbar").setup({}) end
    }, -- Tabbar
    -- use("feline-nvim/feline.nvim")
    {
        "nvim-lualine/lualine.nvim",
        config = function(_) require("lualine").setup({}) end
    }, "WhoIsSethDaniel/lualine-lsp-progress.nvim", -- Visuals
    "karb94/neoscroll.nvim", "lukas-reineke/indent-blankline.nvim",
    "camspiers/animate.vim", "ryanoasis/vim-devicons",
    "kyazdani42/nvim-web-devicons", "junegunn/goyo.vim",
    "norcalli/nvim-colorizer.lua", {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function(_) require("startup") end
    }, "mvllow/modes.nvim", -- "simrat39/symbols-outline.nvim",
    "rcarriga/nvim-notify", {
        'VonHeikemen/searchbox.nvim',
        dependencies = {'MunifTanjim/nui.nvim'}
    }, {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function(_) require("todo-comments").setup({}) end
    }, -- Utilities
    {
        "milkias17/reloader.nvim",
        dependencies = {"nvim-lua/plenary.nvim"}
    }, {
        "nvim-telescope/telescope.nvim",
        dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }, "smartpde/telescope-recent-files", "airblade/vim-rooter",
    "dstein64/vim-startuptime", "chrisbra/unicode.vim",
    "AndrewRadev/splitjoin.vim", "pechorin/any-jump.vim",
    "folke/which-key.nvim", "skywind3000/asyncrun.vim",
    'mfussenegger/nvim-dap', "mrjones2014/legendary.nvim",
    "stevearc/dressing.nvim", -- "github/copilot.vim",
    -- Language stuff
    "vim-test/vim-test", -- Colortheme
    'rktjmp/lush.nvim', 'Yazeed1s/oh-lucy.nvim',
    -- "tjdevries/colorbuddy.nvim",
    "morhetz/gruvbox", "sainnhe/everforest", "mrjones2014/lighthaus.nvim",
    "folke/tokyonight.nvim", "EdenEast/nightfox.nvim", "katawful/kat.nvim",
    "karoliskoncevicius/sacredforest-vim", {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    }, -- Commenting
    {
        'numToStr/Comment.nvim',
        config = function(_) require("Comment").setup() end
    }, -- TPope stuff
    "tpope/vim-surround", "tpope/vim-abolish", "tpope/vim-fugitive",
    "tpope/vim-eunuch", "airblade/vim-gitgutter", "Raimondi/delimitMate",

    -- Snippet engine
    'dcampos/nvim-snippy', 'dcampos/cmp-snippy', 'honza/vim-snippets',
    -- 'dcampos/nvim-snippy',

    'lewis6991/impatient.nvim'

})

utils.setup_plugins({
    "trouble", "tabout", "Comment", "toggleterm", "neoscroll", "modes"
})

require("which-key").setup({
    plugins = {
        presets = {
            operators = false
        }
    }
})

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    show_end_of_line = true
}

local dap = require('dap')
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            return require("py_lsp.lsp").get_current_python_venv_path()
        end
    }
}

