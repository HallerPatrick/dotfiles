local utils = require("utils")

local cmd = vim.cmd

cmd("filetype plugin indent on")

-- Global status line
utils.opt("o", "laststatus", 3)
utils.opt("o", "termguicolors", true)
utils.opt("o", "autoindent", true)
utils.opt("o", "timeoutlen", 300)
utils.opt("o", "encoding", "utf-8")
utils.opt("o", "scrolloff", 8)
utils.opt("o", "hidden", true)
utils.opt("o", "relativenumber", true)
utils.opt("o", "number", true)
utils.opt("o", "shiftwidth", 4)
utils.opt("o", "expandtab", true)
utils.opt("o", "clipboard", "unnamed,unnamedplus")
utils.opt("o", "mouse", "a")

utils.opt("o", "wildmenu", true)
utils.opt("o", "wildmode", "list:longest")
utils.opt(
    "o",
    "wildignore",
    ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"
)
utils.opt("o", "incsearch", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "gdefault", true)
utils.opt("o", "ttyfast", true)
utils.opt("o", "lazyredraw", true)
utils.opt("o", "completeopt", "menuone,noinsert,noselect")

utils.opt("o", "tabstop", 4)
utils.opt("o", "cmdheight", 2)
utils.opt("o", "updatetime", 300)
utils.opt("o", "signcolumn", "yes")
utils.opt("o", "guifont", "JetBrains Mono:h14")


if vim.fn.executable("rg") then
  utils.opt("o", "grepprg", [[ rg\ --no-heading\ --vimgrep ]])
  utils.opt("o", "grepformat", "%f:%l:%c:%m")
end

-- vim.o.shortmess = vim.o.shortmess + "c"

-- Autoformat on save
-- cmd("autocmd! BufWritePre * | Neoformat")

vim.g.python3_host_prog = '/Users/patrickhaller/.pyenv/versions/neovim3/bin/python'
vim.g.rustfmt_autosave = 1

vim.g.neoformat_enabled_python = {"black"}
vim.g.neoformat_enabled_javascript = {"prettier"}

-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- Trigger a highlight only when pressing f and F.
vim.g.qs_highlight_on_keys = {'f', 'F'}


-- vim.g.dashboard_default_executive = 'telescope'
vim.g.indentLine_fileTypeExclude = 'dashboard'
-- vim.g.dashboard_custom_header = {
--     "", "", "", "",
--     "   ▄████▄        ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒",
--     "  ███▄█▀        ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒",
--     " ▐████  █  █    ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
--     "  █████▄        ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
--     "    ████▀       ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒",
--     "", "", "", ""
-- }

vim.g.asyncrun_open = 6

-- Latex
vim.g.vimtex_view_method = 'zathura'
vim.g.livepreview_previewer = 'zathura'
vim.g.livepreview_engine = 'latexmk -xelatex -f'


-- AuGroups
--
local augroup = vim.api.nvim_create_augroup('highlight_yank', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = augroup,
  command = [[ silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700} ]],
  desc = 'highglight yanked group'
})

vim.api.nvim_create_autocmd("FileType",{
  pattern = {"tex", "lua", "cpp"},
  command = [[ setlocal shiftwidth=2 softtabstop=2 expandtab ]]
})

