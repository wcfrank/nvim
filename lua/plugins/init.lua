return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "day",
				-- transparent=true,
			})
			-- vim.cmd[[colorscheme tokyonight]]  I changed to rose-pine afterwards
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "dawn",
				dark_variant = "moon",
				bold_vert_split = true, --分割线加粗
				dim_nc_background = true, --非活动窗口背景变暗
				disable_background = false, --禁用背景色
				disable_float_background = false, --禁用浮动窗口背景
				disable_italics = true, --禁用斜体
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},

	{
		"nvim-lualine/lualine.nvim", -- 插件名称
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- 可选：用于显示图标
		config = function()
			-- 调用 lualine 的 setup 函数，并传递配置选项
			require("lualine").setup({
				options = {
					-- theme = "tokyonight", -- 使用 tokyonight 主题
					theme = "rose-pine", -- 使用rose-pine主题
					component_separators = { left = "|", right = "|" }, -- 组件分隔符
					section_separators = { left = "", right = "" }, -- 部分分隔符
				},
				sections = {
					lualine_a = { "mode" }, -- 左侧第一部分：显示当前模式
					lualine_b = { "branch", "diff", "diagnostics" }, -- 左侧第二部分：显示分支、差异和诊断信息
					lualine_c = { "filename" }, -- 左侧第三部分：显示文件名
					lualine_x = { "encoding", "fileformat", "filetype" }, -- 右侧第一部分：显示编码、文件格式和文件类型
					lualine_y = { "progress" }, -- 右侧第二部分：显示当前光标位置
					lualine_z = { "location" }, -- 右侧第三部分：显示光标所在行和列
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- branch = "main",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			---@diagnostic disable: missing-fields
			require("nvim-treesitter.configs").setup({
				-- Treesitter 基本功能
				ensure_installed = {
					"python",
					"xml",
					"yaml",
					"bash",
					"dockerfile",
					"html",
					"json",
					"lua",
					"sql",
					"tmux",
					"vim",
					"vimdoc",
					"markdown",
					"markdown_inline",
					-- "latex",
				},
				auto_install = true,
				ignore_install = {},
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<CR>",
						scope_incremental = "<TAB>",
						node_decremental = "<BS>",
					},
				},
				-- Treesitter-context 配置
				context = {
					enable = true, -- 启用上下文显示
					throttle = true, -- 减少性能开销
					max_lines = 3, -- 限制上下文显示的最大行数
					patterns = { -- 自定义支持的语言模式
						default = {
							"class",
							"function",
							"method",
						},
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- 自动向前看以包含分隔符
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]i"] = "@conditional.outer",
							["]l"] = "@loop.outer",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]I"] = "@conditional.outer",
							["]L"] = "@loop.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[i"] = "@conditional.outer",
							["[l"] = "@loop.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
							["[I"] = "@conditional.outer",
							["[L"] = "@loop.outer",
						},
					},
					swap = {},
				},
			})
		end,
	},

	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},

	-- which key
	{
		"folke/which-key.nvim",
		config = true,
	},

	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},

	-- lastplace
	{
		"ethanholz/nvim-lastplace",
		config = true,
	},

	{ "akinsho/bufferline.nvim", config = true },
}
