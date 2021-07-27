local utils = require("utils")

local cmd = vim.cmd

cmd("filetype plugin indent on")
cmd("colorscheme one")

--utils.opt('o', 'visualbell', true)
--utils.opt('o', 'noerrorbells', true)
utils.opt("o", "background", "dark")

utils.opt("o", "termguicolors", true)
utils.opt("o", "autoindent", true)
utils.opt("o", "timeoutlen", 300)
utils.opt("o", "encoding", "utf-8")
utils.opt("o", "scrolloff", 8)
-- utils.opt('o', 'noshowmode', true)
utils.opt("o", "hidden", true)
-- utils.opt('o', 'nowrap', true)
-- utils.opt('o', 'nojoinspaces', true)
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
-- utils.opt('o', 'nobackup', true)
utils.opt("o", "cmdheight", 2)
utils.opt("o", "updatetime", 300)
utils.opt("o", "signcolumn", "yes")

-- utils.opt('o', 'nofoldenable', true)
