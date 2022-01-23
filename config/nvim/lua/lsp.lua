local nvim_lsp = require("lspconfig")
local lang_opts = require("language_opts")

require("completion").setup()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
-- RUST
lang_opts.rust_setup()

-- LUA
nvim_lsp.sumneko_lua.setup(lang_opts.lua)

-- PYTHON
require("py_lsp").setup({
    host_python = "/Users/patrickhaller/opt/anaconda3/bin/python",
    -- on_attach = on_attach,
    language_server = "pyright",
    capabilities = capabilities
    -- source_strategies = { "poetry", "default", "system" }
})

require("lint").linters_by_ft = {
    python = {"pylint", "flake8"}
}

-- Other servers

require("Nvim-lsp-installer").on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

-- local servers = {"pyright", "dartls", "clangd", "jdtls", "hls", "tsserver"}
