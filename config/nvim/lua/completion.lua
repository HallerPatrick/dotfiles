local M = {}

function M.setup()

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
        snippet = {
            expand = function(args)
                require("snippy").expand_snippet(args.body)
            end
        },
        sources = {
            {
                name = "copilot"
            }, {
                name = "snippy"
            }, {
                name = 'nvim_lsp'
            }, {
                name = 'nvim_lua'
            }, {
                name = 'buffer',
                keyword_length = 2
            }, {
                name = 'path'
            }, {
                name = 'emoji'
            }, {
                name = "nvim_lsp_document_symbol"
            }
        },
        experimental = {
            ghost_text = true
        },
        mapping = {
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
            ['<CR>'] = cmp.mapping.confirm({
                select = true
            }),
            -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
            ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
            ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'})
        },
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                maxwidth = 70,
                mode = "symbol_text",
                menu = ({
                    copilot = "[Copilot]",
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    snippy = "[Snippy]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    emoji = "[Emoji]"
                })
            })
        }
    })

    cmp.setup.cmdline('/', {
        sources = cmp.config.sources({
            {
                name = 'nvim_lsp_document_symbol'
            }
        }, {
            {
                name = 'buffer'
            }
        })
    })

    -- cmp.setup.cmdline(':', {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = cmp.config.sources({
    --         {
    --             name = 'path'
    --         }
    --     }, {
    --         {
    --             name = 'cmdline'
    --         }
    --     })
    -- })
    --
end

return M
