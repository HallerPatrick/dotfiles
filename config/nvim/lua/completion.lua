local M = {}

function M.has_words_before()

    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") ==
               nil
end

function M.setup()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local complete_select_down = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif M.has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, {"i", "s"})

    local complete_select_up = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {"i", "s"})

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end
        },
        sources = {
            {
                name = 'nvim_lsp'
            }, {
                name = 'nvim_lua'
            }, {
                name = 'luasnip'
            }, {
                name = 'buffer',
                keyword_length = 2
            }, {
                name = 'path'
            }, {
                name = 'emoji'
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

            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),

            -- Doesn't work in Mac Terminal
            -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'})

            ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
            ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'})
        },
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                maxwidth = 70,
                mode = "symbol_text",
                menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                })
            })
        }

    })

end

return M
