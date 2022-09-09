local nvim_lsp_configs = require "lspconfig.configs"
local nvim_lsp = require("lspconfig")
local lang_opts = require("language_opts")

require("completion").setup()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

-- RUST
lang_opts.rust_setup()

-- LUA
nvim_lsp.sumneko_lua.setup(lang_opts.lua)

-- LATEX
nvim_lsp.texlab.setup(lang_opts.latex)

nvim_lsp_configs["jedi_language_server"] = {
    default_config = {
        cmd = {"jedi-language-server"},

        -- Depending on your environment
        root_dir = nvim_lsp.util.root_pattern(".git", "setup.py",
                                              "pyproject.toml"),
        filetypes = {"python"}
    }
}


-- Other servers
-- require("Nvim-lsp-installer").on_server_ready(function(server)
--     local opts = {}
--     server:setup(opts)
-- end)




function filter(arr, func)
	-- Filter in place
	-- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do arr[i] = nil end
end


function filter_diagnostics(diagnostic)

    -- Disable pyright linting
	if diagnostic.source == "Pyright" then
		return false
	end


	-- Allow kwargs to be unused, sometimes you want many functions to take the
	-- same arguments but you don't use all the arguments in all the functions,
	-- so kwargs is used to suck up all the extras
	if diagnostic.message == '"kwargs" is not accessed' then
		return false
	end

	-- Allow variables starting with an underscore
	if string.match(diagnostic.message, '"_.+" is not accessed') then
		return false
	end

	return true
end

function custom_on_publish_diagnostics(a, params, client_id, c, config)
	filter(params.diagnostics, filter_diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	custom_on_publish_diagnostics, {})



local severities = {
  error = vim.diagnostic.severity.ERROR,
  fatal = vim.diagnostic.severity.ERROR,
  warning = vim.diagnostic.severity.WARN,
  refactor = vim.diagnostic.severity.INFO,
  info = vim.diagnostic.severity.INFO,
  convention = vim.diagnostic.severity.HINT,
}

-- PYTHON
require("py_lsp").setup({
    host_python = "/Users/patrickhaller/opt/anaconda3/bin/python",
    language_server = "pyright",
    capabilities = capabilities,
    on_server_ready = function(venv_path, venv_name)
      require('lint').linters.pylint = {
        cmd = venv_path,
        stdin = false,
        -- args = {
        --   '-m', 'pylint', '-f', 'json'
        -- },
        --
        args = {
          '-m', 'pylint', '-f', 'json'
        },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          local buffer_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":~:.")

          for _, item in ipairs(vim.json.decode(output) or {}) do
            if not item.path or vim.fn.fnamemodify(item.path, ":~:.") == buffer_path then
              local column = item.column > 0 and item.column or 0
              local end_column = item.endColumn ~= vim.NIL and item.endColumn or column
              table.insert(diagnostics, {
                source = 'pylint',
                lnum = item.line - 1,
                col = column,
                end_lnum = item.line - 1,
                end_col = end_column,
                severity = assert(severities[item.type], 'missing mapping for severity ' .. item.type),
                message = item.message,
                user_data = {
                  lsp = {
                    code = item['message-id'],
                  },
                },
              })
            end
          end

          return diagnostics
      end,
    }
  end
})
