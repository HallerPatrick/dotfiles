local nvim_lsp_configs = require "lspconfig.configs"
local nvim_lsp = require("lspconfig")
local lang_opts = require("language_opts")

require("completion").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                                                                      .make_client_capabilities())

-- Other servers
-- require("Nvim-lsp-installer").on_server_ready(function(server)
--     local opts = {}
--     server:setup(opts)
-- end)

-- RUST
-- lang_opts.rust_setup({})
nvim_lsp.rust_analyzer.setup({})

-- LUA
nvim_lsp.sumneko_lua.setup(lang_opts.lua)

-- LATEX
nvim_lsp.texlab.setup(lang_opts.latex)

-- C++
nvim_lsp.clangd.setup({})

-- nvim_lsp_configs["jedi_language_server"] = {
--     default_config = {
--         cmd = {"jedi-language-server"},
--
--         -- Depending on your environment
--         root_dir = nvim_lsp.util.root_pattern(".git", "setup.py",
--                                               "pyproject.toml"),
--         filetypes = {"python"}
--     }
-- }
--
-- nvim_lsp.pylsp.setup({
--     settings = {
--         pylsp = {
--             plugins = {
--                 pycodestyle = {
--                     ignore = {'W391'},
--                     maxLineLength = 100
--                 },
--                 jedi = {
--                     environment = "/Users/patrickhaller/Projects/GERPT/venv"
--                 },
--                 jedi_completion = {enabled = true}
--             }
--         }
--     }
-- })

-- PYTHON
require("py_lsp").setup({
    host_python = "/Users/patrickhaller/opt/anaconda3/bin/python",
    language_server = "pyright",
    -- capabilities = capabilities,
    on_server_ready = function(venv_path, venv_name) end,
    source_strategies = {"default", "poetry", "system", "env_path"},
    default_venv_name = "venv",
    plugins = {
      notify = {
        use = false
      }
    }

})
--
-- require("mason").setup()
