vim.cmd([[packadd packer.nvim]])

-- Init plugins
require("statusline")
require("which-key").setup({})
require("trouble").setup({})
require("tabout").setup({})

local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
    -- default_hl = {
    --     focused = {
    --         fg = get_hex('Normal', 'fg'),
    --         bg = get_hex('ColorColumn', 'bg')
    --     },
    --     unfocused = {
    --         fg = get_hex('Comment', 'fg'),
    --         bg = get_hex('ColorColumn', 'bg')
    --     }
    -- },

    components = {
        {
            text = '｜',
            hl = {
                fg = function(buffer)
                    return
                        buffer.is_modified and vim.g.terminal_color_3 -- yellow
                        or vim.g.terminal_color_2 -- green
                end
            }
        }, {
            text = function(buffer) return buffer.devicon.icon .. ' ' end,
            hl = {
                fg = function(buffer) return buffer.devicon.color end
            }
        }, {
            text = function(buffer) return buffer.index .. ': ' end
        }, {
            text = function(buffer) return buffer.unique_prefix end,
            hl = {
                fg = get_hex('Comment', 'fg'),
                style = 'italic'
            }
        }, {
            text = function(buffer) return buffer.filename .. ' ' end,
            hl = {
                style = function(buffer)
                    return buffer.is_focused and 'bold' or nil
                end
            }
        }, {
            text = ' '
        }
    }
})

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("HallerPatrick/nvim_todo.vim")

    use("/Users/patrickhaller/Projects/py_lsp.nvim")
    use("nvim-lua/lsp_extensions.nvim")

    use 'famiu/feline.nvim'

    use("mbbill/undotree")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })

    use("neovim/nvim-lspconfig")
    use("kabouzeid/nvim-lspinstall")
    use({
        'simrat39/rust-tools.nvim',
        config = function() require('rust-tools').setup({}) end
    })

    use 'mfussenegger/nvim-lint'

    use("nvim-lua/completion-nvim")
    use("ray-x/lsp_signature.nvim")
    use("bfredl/nvim-luadev")
    use("abecodes/tabout.nvim")
    use("sbdchd/neoformat")

    -- use("andrejlevkovitch/vim-lua-format")

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('indent_blankline').setup({}) end
    })

    use("/Users/patrickhaller/Projects/cokeline.nvim")

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
    use("mhinz/vim-startify")
    use("dstein64/vim-startuptime")
    use("norcalli/nvim-colorizer.lua")
    use("chrisbra/unicode.vim")
    use("AndrewRadev/splitjoin.vim")
    use("pechorin/any-jump.vim")
    use("vimwiki/vimwiki")
    use("jbyuki/venn.nvim")

    -- Language stuff
    use("pangloss/vim-javascript")
    use("mxw/vim-jsx")
    use("vim-test/vim-test")
    use("bfredl/nvim-ipy")
    use("dart-lang/dart-vim-plugin")
    use("natebosch/vim-lsc")
    use("natebosch/vim-lsc-dart")

    -- Colortheme
    use("hzchirs/vim-material")
    -- use("pineapplegiant/spaceduck")
    -- use("relastle/bluewery.vim")
    -- use("1612492/github.vim")
    -- use("https://github.com/wojciechkepka/bogster")
    -- use("rakr/vim-one")
    --
    use("folke/lsp-colors.nvim")

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.nvim_exec("mkdp#util#install()") end
    }) -- , { 'do': { -> mkdp#util#install() } }

    -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    use("metakirby5/codi.vim")
    use("lervag/vimtex")
    use("rhysd/vim-grammarous")
    use("godlygeek/tabular")
    use("plasticboy/vim-markdown")
    use("junegunn/vim-easy-align")
    use("cohama/lexima.vim")

    -- Commenting
    use("tpope/vim-commentary")
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

    use("SirVer/ultisnips")
    use('honza/vim-snippets')
    -- use 'norcalli/snippets.nvim'

    use("folke/which-key.nvim")
    use("matbme/JABS.nvim")
end)
