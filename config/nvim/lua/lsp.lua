local nvim_lsp = require("lspconfig")
local lang_opts = require("language_opts")

require("completion").setup()

nvim_lsp.rust_analyzer.setup({})

-- LUA
nvim_lsp.lua_ls.setup({})

-- LATEX
nvim_lsp.texlab.setup(lang_opts.latex)

-- C++
nvim_lsp.clangd.setup({})


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
require("mason").setup()

nvim_lsp.tsserver.setup({})
nvim_lsp.svelte.setup({})
