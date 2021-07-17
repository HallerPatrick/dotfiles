local utils = require('utils')


vim.g.mapleader = ' '

-- Fast closing
utils.map('n', '<leader>q', ':q<cr>')

-- Fast infile search
utils.map('n', '<leader>s', ':Rg<cr>')

-- Open new file adjacent to current file
utils.map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Quick save
utils.map('n', '<leader>w', ':w<cr>')

-- set nohlsearch
utils.map('n', '<leader>h', ':noh')

utils.map('n', '<leader>f', ':Files')
utils.map('n', '<leader><leader>', '<c-^>')

utils.map('n', '<leader>n', ':bnext<cr>')
utils.map('n', '<leader>b', ':bd<cr>')

utils.map('n', '<leader>v', ':vsplit<cr>')

-- Plugin related leader maps
utils.map('n', '<leader>tf', ':TestFile<cr>')
utils.map('n', '<leader>tn', ':TestNearest<cr>')
utils.map('n', '<leader>b', ':TagbarToggle<cr>')
utils.map('n', '<leader>td', ':TodoList<cr>')
utils.map('n', '<leader>ho', ':JABSOpen<cr>')


utils.map('t', '<Esc>', '<C-\\><C-n>')

-- Disable Ex Mode entering
utils.map('n', 'q:', '<Nop>')
utils.map('n', 'Q', '<Nop>')

utils.map('n', 'H', '_')
utils.map('n', 'L', '$')

utils.map('n', 'j', 'gj')
utils.map('n', 'k', 'gk')

utils.map('n', 'J', '')
