
---Custom component to display lsp client and venv name for python
---@param _ any
---@return string Whitespace seperated list of lsp clients
local function lsp_provider(_)
    local clients = {}

    for _, client in pairs(vim.lsp.get_active_clients()) do
        if client.name == "pyright" then
            if client.config.settings.python["pythonPath"] ~= nil then
                local venv_name = client.config.settings.python.venv_name
                clients[#clients + 1] = client.name .. "[" .. venv_name .. "]"
            end
        else
            clients[#clients + 1] = client.name
        end
    end

    return table.concat(clients, " ")
end

require("lualine").setup({
    sections = {
        lualine_c = {"filename", lsp_provider, "lsp_progress"}
    }
})
