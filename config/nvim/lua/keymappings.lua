vim.g.mapleader = " "

-- Movement based keymaps
local movement_keymaps = {
    {
        'H',
        "_",
        description = 'Shortcut for moving to begining of line',
        mode = {"n", "v"}
    }, {
        'L',
        "$",
        description = 'Shortcut for moving to end of line',
        mode = {"n", "v"}
    }, {
        'j',
        "gj",
        description = 'Move always done, even with line break'
    }, {
        'k',
        "gk",
        description = 'Move always up, even with line break'
    }
}

local leader_keymaps = {
    {
        '<leader>q',
        ":q<cr>",
        description = 'Open next open buffer'
    }, {
        '<leader>e',
        ':e <C-R>=expand("%:p:h") . "/" <cr>',
        description = 'Display files for opening that are adjacent to current file'
    }, {
        '<leader>w',
        ":w<cr>",
        description = 'Quicksave'
    }, {
        '<leader>h',
        ":noh<cr>",
        description = 'Set nohlsearch'
    }, -- Buffer things
    {
        '<leader>n',
        ":bnext<cr>",
        description = 'Open next open buffer'
    }, {
        '<leader>b',
        ":bd<cr>",
        description = 'Open previous open buffer'
    }, {
        '<leader>v',
        ":vsplit<cr>",
        description = 'Split current buffer vertically'
    }, {
        '<leader><leader>',
        "<c-^>",
        description = 'Toggle previous buffer'
    }, -- Plugin related leader maps
    {
        '<leader>tf',
        ":TestFile<cr>",
        description = 'Run tests in current file'
    }, {
        '<leader>tn',
        ":TestNearest<cr>",
        description = 'Run nearest tests to cursor'
    }, {
        '<leader>b',
        ":TagbarToggle<cr>",
        description = 'Toggle tagbar of current file'
    }, {
        '<leader>j',
        ":AnyJump<cr>",
        description = 'Jump..anywhere'
    }, {
        '<leader>rr',
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        description = 'Show refactoring options',
        mode = {"v"}
    }, {
        '<leader>t',
        ":JABSOpen<cr>",
        description = 'Show open buffers'
    }, {
        '<leader>rn',
        ":lua vim.lsp.buf.rename()<CR>",
        description = 'Rename variable under cursor'
    }
}

-- Telescope mappings
local telescope_keymaps = {
    {
        '<leader>f',
        ":Telescope find_files<cr>",
        description = 'File finder'
    }, {
        '<leader>s',
        ":Telescope live_grep<cr>",
        description = 'In-file search'
    }, {
        '<leader>bb',
        ":Telescope buffers<cr>",
        description = 'Show all open buffers'
    }, {
        '<leader>tq',
        ":Telescope quickfix<cr>",
        description = 'Show quickfix window'
    }, {
        '<leader>ts',
        ":Telescope lsp_document_symbols<cr>",
        description = 'Show document symbols under cursor'
    }, {
        '<leader>ca',
        ":Telescope lsp_code_actions<cr>",
        description = 'Display code actions'
    }
}

local misc_keymaps = {
    {
        'q:',
        "<Nop>",
        description = 'Disable Ex Mode entering cause of typo'
    }, {
        'Q:',
        "<Nop>",
        description = 'Disable Ex Mode entering cause of typo'
    }, {
        '/',
        ":SearchBoxIncSearch<cr>",
        description = 'Display little input box for search'
    }, {
        '<Esc>',
        "<C-\\><C-n>",
        description = 'Escape insert mode in terminal mode',
        mode = {"t"}
    }
}

require('legendary').bind_keymaps(movement_keymaps)
require('legendary').bind_keymaps(leader_keymaps)
require('legendary').bind_keymaps(telescope_keymaps)
require('legendary').bind_keymaps(misc_keymaps)

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {
    expr = true
})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {
    expr = true
})

