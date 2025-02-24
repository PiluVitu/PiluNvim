return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- 	{
	-- 		"nvimdev/dashboard-nvim",
	-- 		event = "VimEnter",
	-- 		opts = function(_, opts)
	-- 			local logo = [[
	--  ________  ___  ___       ___  ___  ___      ___ ___  _________  ___  ___
	-- |\   __  \|\  \|\  \     |\  \|\  \|\  \    /  /|\  \|\___   ___\\  \|\  \
	-- \ \  \|\  \ \  \ \  \    \ \  \\\  \ \  \  /  / | \  \|___ \  \_\ \  \\\  \
	--  \ \   ____\ \  \ \  \    \ \  \\\  \ \  \/  / / \ \  \   \ \  \ \ \  \\\  \
	--   \ \  \___|\ \  \ \  \____\ \  \\\  \ \    / /   \ \  \   \ \  \ \ \  \\\  \
	--    \ \__\    \ \__\ \_______\ \_______\ \__/ /     \ \__\   \ \__\ \ \_______\
	--     \|__|     \|__|\|_______|\|_______|\|__|/       \|__|    \|__|  \|_______|
	-- ]]
	--
	-- 			logo = string.rep("\n", 8) .. logo .. "\n\n"
	-- 			opts.config.header = vim.split(logo, "\n")
	-- 		end,
	-- 	},
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
 ________  ___  ___       ___  ___  ___      ___ ___  _________  ___  ___     
|\   __  \|\  \|\  \     |\  \|\  \|\  \    /  /|\  \|\___   ___\\  \|\  \    
\ \  \|\  \ \  \ \  \    \ \  \\\  \ \  \  /  / | \  \|___ \  \_\ \  \\\  \   
 \ \   ____\ \  \ \  \    \ \  \\\  \ \  \/  / / \ \  \   \ \  \ \ \  \\\  \  
  \ \  \___|\ \  \ \  \____\ \  \\\  \ \    / /   \ \  \   \ \  \ \ \  \\\  \ 
   \ \__\    \ \__\ \_______\ \_______\ \__/ /     \ \__\   \ \__\ \ \_______\
    \|__|     \|__|\|_______|\|_______|\|__|/       \|__|    \|__|  \|_______|
]],
					---@type snacks.dashboard.Item[]
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{ icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
		},
	},
}
