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
vim.loader.enable()

require("lazy").setup({
    "karoliskoncevicius/sacredforest-vim", {
        "nvim-treesitter/nvim-treesitter",
        build = "TSUpdate"
    }, 'nvim-treesitter/nvim-treesitter-context', 'nvim-treesitter/playground',

    -- Lsp related
    "neovim/nvim-lspconfig", {
        "williamboman/mason.nvim",
       config = function() require("mason").setup() end
    }, {
      "williamboman/mason-lspconfig.nvim",
       config = function() require("mason-lspconfig").setup() end
    }, "onsails/lspkind-nvim",
    "hrsh7th/nvim-cmp", 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path', "hrsh7th/cmp-emoji", 'hrsh7th/cmp-nvim-lua',
    "lukas-reineke/cmp-rg",
    "stevearc/oil.nvim",
    {
        dir = "/home/phmaker/Projects/py_lsp.nvim",
    },
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "nvim-lua/lsp_extensions.nvim", "ray-x/lsp_signature.nvim",
    "glepnir/lspsaga.nvim", 'simrat39/rust-tools.nvim', "folke/lsp-colors.nvim",
    "folke/trouble.nvim", {
        "SmiteshP/nvim-gps",
        dependencies = "nvim-treesitter/nvim-treesitter"
    }, -- Code Style, Refactoring, etc..
    "sbdchd/neoformat", -- Language specific
    "stsewd/isort.nvim", "daveyarwood/vim-alda", "bfredl/nvim-luadev",
    "ap/vim-css-color", "dag/vim-fish", "abecodes/tabout.nvim", -- Terminal
    "akinsho/toggleterm.nvim", -- Bufferline
    "akinsho/bufferline.nvim", {
        "petertriho/nvim-scrollbar",
        config = function(_) require("scrollbar").setup({}) end
    }, -- Tabbar
    -- use("feline-nvim/feline.nvim")
    {
        "nvim-lualine/lualine.nvim",
    },
    { 'Bekaboo/dropbar.nvim' },
    "karb94/neoscroll.nvim", "lukas-reineke/indent-blankline.nvim",
    "camspiers/animate.vim", "ryanoasis/vim-devicons",
    "kyazdani42/nvim-web-devicons", "junegunn/goyo.vim",
    "mvllow/modes.nvim",
    "rcarriga/nvim-notify", -- {
    {
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

    {
      "chipsenkbeil/distant.nvim",
      branch = "v0.2",
      config = function()
        require('distant').setup {
          ['*'] = require('distant.settings').chip_default()
        }
      end
    },

    -- Debugging
    "folke/neodev.nvim",
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
    "mrjones2014/legendary.nvim", "stevearc/dressing.nvim", -- 
    -- Language stuff
    "zbirenbaum/copilot.lua",
    "lervag/vimtex",
    "evanleck/vim-svelte",
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {{ "zbirenbaum/copilot.lua" }},
      config = function ()
        require("copilot_cmp").setup()
      end
    },

    "huggingface/hfcc.nvim",
    "elkowar/yuck.vim",
    "vim-test/vim-test",
    -- Colortheme
    'rakr/vim-two-firewatch',
    'yashguptaz/calvera-dark.nvim',
    "Everblush/nvim",
    'arcticicestudio/nord-vim',
    'rktjmp/lush.nvim',
    'Yazeed1s/oh-lucy.nvim',
    {
        "HallerPatrick/vito.nvim",
        dependencies = {"tjdevries/colorbuddy.nvim"},
    }, -- "tjdevries/colorbuddy.nvim",
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
    -- "tpope/vim-surround",
    {
        "kylechui/nvim-surround",
        tag = "*",
        config = function(_) require("nvim-surround").setup({}) end
    }, "tpope/vim-abolish", "tpope/vim-fugitive", "tpope/vim-eunuch",
    "airblade/vim-gitgutter", --[[ "Raimondi/delimitMate", ]] -- Snippet engine
    'dcampos/nvim-snippy', 'dcampos/cmp-snippy', 'honza/vim-snippets',
})


utils.setup_plugins({
    "trouble", "tabout", "Comment", "toggleterm", "neoscroll", "modes", "dapui", "oil"
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

require("vito").setup {
  comment_italics = true,
  float_background = false,
  reverse_visual = false,
}


local dap = require('dap')

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = '/home/phmaker/.conda/envs/nvim/bin/python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

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

require("copilot").setup({
  suggestion = { enabled = true },
  panel = { enabled = true },
})

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})


-- local hfcc = require('hfcc')
--
-- hfcc.setup({
--   api_token = "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",
--   model = "bigcode/starcoder",
--   query_params = {
--     max_new_tokens = 60,
--     temperature = 0.2,
--     top_p = 0.95,
--     stop_token = "<|endoftext|>",
--   },
--   -- set this if the model supports fill in the middle
--   fim = {
--     enabled = true,
--     prefix = "<fim_prefix>",
--     middle = "<fim_middle>",
--     suffix = "<fim_suffix>",
--   },
--   accept_keymap = "<Tab>",
-- })

