local utils = {}

local scopes = {
    o = vim.o,
    b = vim.bo,
    w = vim.wo
}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then scopes["o"][key] = value end
end

function utils.require_plugins(...)
    for _, plugin in pairs(...) do
      local ok, _ = pcall(require, plugin)

      if not ok then
        print("Could not load plugin: " .. plugin)
      end
      -- require(plugin) 
    end
end

function utils.setup_plugins(...)
    for _, plugin in pairs(...) do
      local ok, loaded_plugin = pcall(require, plugin)

      if ok then
        if loaded_plugin.setup then
          loaded_plugin.setup({})
        end
      else
        print("Could not load and setup plugin: " .. plugin)
      end
    end
end

return utils
