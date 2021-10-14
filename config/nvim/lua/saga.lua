local u = require("utils")

local saga = require("lspsaga")

saga.init_lsp_saga {}

u.map("n", "<leader>clf", ":Lspsaga lsp_finder<cr>")
u.map("n", "<leader>cca", ":Lspsaga code_action<CR>")

