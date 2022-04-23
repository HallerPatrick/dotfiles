local M = {}

local user = vim.fn.expand("$USER")

local sumneko_root_path = "/Users/" .. user ..
                              "/.config/nvim/lua-language-server"
local sumneko_binary = "/Users/" .. user ..
                           "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"

M.lua = {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    [vim.fn.expand("/Users/" .. user .. "/.config/nvim/lua")] = true
                }
            }
        }
    }
}

M.rust = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = ""
        }
    },

    runnables = {
        use_telescope = true
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                }

            }
        }
    }
}

function M.rust_setup() require("rust-tools").setup(M.rust) end

return M
