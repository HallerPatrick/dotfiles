local tterm = require("tterm")

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

local lsp_keymaps = {
    -- {
    --     'gd',
    --     vim.lsp.buf.definition,
    --     description = 'Jump to defintion'
    -- },
    {
        'gd',
        vim.lsp.buf.declaration,
        description = 'Jump to declaration'
    }, {
        'K',
        vim.lsp.buf.hover,
        description = 'Hover docs'
    }, {
      'gD',
      require("utils").open_split_buffer_goto_definition,
      description = "Jump to defintion in a new or existing split window"
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
        '<leader>j',
        ":AnyJump<cr>",
        description = 'Jump..anywhere'
    }, {
        '<leader>rr',
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        description = 'Show refactoring options',
        mode = {"v"}
    }, {
        '<leader>rf',
        "<Esc><cmd>lua require('telescope').extensions.recent_files.pick()<CR>",
        description = 'Show recent files'
    }, {
        '<leader>rn',
        ":lua vim.lsp.buf.rename()<CR>",
        description = 'Rename variable under cursor'
    }, {
       '<leader>pr',
       ":PyRun<CR>",
       description = "Run current python buffer with venv"
    }, {
      '<leader>sv',
      ":'<,'>ToggleTermSendVisualSelection<CR>",
      description = "Send visual selection to toggle term",
      mode = { "v" }
    },
    {
      '<leader>ip',
      ":lua require('tterm').create_ipython()<CR>",
      description = "",
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
        '<leader>b',
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
    }, {
        '<leader>fu',
        ":Telescope lsp_references<cr>",
        description = 'Find usages of symbol under cursor'
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


local legendary = require('legendary')

legendary.keymaps(movement_keymaps)
legendary.keymaps(leader_keymaps)
legendary.keymaps(lsp_keymaps)
legendary.keymaps(telescope_keymaps)
legendary.keymaps(misc_keymaps)

