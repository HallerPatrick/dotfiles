local lsp = require("feline.providers.lsp")

require("nvim-gps").setup()

local colors = {
    bg = "#282828",
    bg1 = "#3c3836", -- cursor color
    bg2 = "#32302f",
    bg4 = "#45403d",
    bg5 = "#5a524c",
    fg = "#d4be98",
    fg1 = "#ddc7a1",
    red = "#ea6962",
    orange = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    aqua = "#89b482",
    blue = "#7daea3",
    purple = "#d3869b",
    bg_red = "#ea6962",
    bg_green = "#a9b665",
    bg_yellow = "#d8a657",
    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",
    white = "#f2e5bc",
    black = "#1d2021",
    none = "NONE",
    cyan = "#7daea3",
    pink = "#d3869b",
    link = "#89b482",
    cursor = "#ddc7a1"
}

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ["V-REPLACE"] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

local icons = {
    linux = " ",
    macos = " ",
    windows = " ",

    errs = " ",
    warns = " ",
    infos = " ",
    hints = " ",

    lsp = " ",
    git = ""
}

local function file_osinfo()
    local os
    local icon
    if vim.fn.has("mac") == 1 then
        icon = icons.macos
        os = "Mac"
    elseif vim.fn.has("unix") == 1 then
        icon = icons.linux
        os = "Unix"
    else
        icon = icons.windows
        os = "Windows"
    end
    return icon .. os
end

local function vimode_hl()
    return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color()
    }
end

local function lsp_provider(component)
    local clients = {}
    local icon = component.icon or " "

    for _, client in pairs(vim.lsp.buf_get_clients()) do
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

-- LuaFormatter off

local comps = {
	vi_mode = {
		left = {
			provider = "▊",
			hl = vimode_hl,
			right_sep = " ",
		},
		right = {
			provider = "▊",
			hl = vimode_hl,
			left_sep = " ",
		},
	},
	file = {
		info = {
			provider = "file_info",
			hl = {
				fg = colors.blue,
				style = "bold",
			},
		},
		encoding = {
			provider = "file_encoding",
			left_sep = " ",
			hl = {
				fg = colors.violet,
				style = "bold",
			},
		},
		type = {
			provider = "file_type",
		},
		os = {
			provider = file_osinfo,
			left_sep = " ",
			hl = {
				fg = colors.violet,
				style = "bold",
			},
		},
	},
	line_percentage = {
		provider = "line_percentage",
		left_sep = " ",
		hl = {
			style = "bold",
		},
	},
	scroll_bar = {
		provider = "scroll_bar",
		left_sep = " ",
		hl = {
			fg = colors.blue,
			style = "bold",
		},
	},
	lsp = {
		name = {
			provider = lsp_provider,
			left_sep = " ",
			icon = icons.lsp,
			hl = {
				fg = colors.yellow,
			},
		},
	},
	git = {
		branch = {
			provider = "git_branch",
			icon = icons.git,
			left_sep = " ",
			hl = {
				fg = colors.violet,
				style = "bold",
			},
		},
		add = {
			provider = "git_diff_added",
			hl = {
				fg = colors.green,
			},
		},
		change = {
			provider = "git_diff_changed",
			hl = {
				fg = colors.orange,
			},
		},
		remove = {
			provider = "git_diff_removed",
			hl = {
				fg = colors.red,
			},
		},
	},
    gps = {
      	provider = function()
		  return require("nvim-gps").get_location()
	    end,
	enabled = function()
		return require("nvim-gps").is_available()
      end
    }
}

local components = {
  active = {},
  inactive = {}
}

local active_left = {
  comps.file.info,
  comps.lsp.name
}

local active_right = {
  comps.gps,
  comps.git.add,
  comps.git.change,
  comps.git.remove,
  comps.file.os,
  comps.git.branch,
  comps.line_percentage,
  comps.scroll_bar,

}

local inactive_left = {
	comps.file.info,
}


table.insert(components.active, active_left)
table.insert(components.active, {})
table.insert(components.active, active_right)

table.insert(components.inactive, inactive_left)
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- LuaFormatter on

require("feline").setup({
    components = components
    -- vi_mode_colors = vi_mode_colors
})
