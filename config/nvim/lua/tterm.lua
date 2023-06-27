local format = string.format

local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
local py_lsp = nil -- require("py_lsp.lsp")

local M = {
  terminal_id = nil
}


M.create_ipython = function ()
    local python_path = py_lsp.get_current_python_venv_path()

    local terminal = Terminal:new({
        cmd = format("%s -m IPython", python_path),
        close_on_exit = false,
        on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
                noremap = true,
                silent = true
            })
        end,
        on_close = function(_)
          M.terminal_id = nil
          vim.cmd("startinsert!")
        end

    })

    terminal:toggle()

    return terminal
end

M.visual_selection_to_toggleterm = function (id)
    local args = { args = id }
    -- local command = format("'<,'>ToggleTermSendVisualSelection %s<CR>", id)

    toggleterm.send_lines_to_terminal("visual_selection", true, args)
end

M.run_ipython = function ()
  vim.pretty_print(M)
  if M.terminal_id == nil then
    local terminal = M.create_ipython()
    M.terminal_id = terminal.id
    vim.pretty_print(M)
    vim.pretty_print("Hello")
  else
    M.visual_selection_to_toggleterm(M.terminal_id)
  end

end

return M
