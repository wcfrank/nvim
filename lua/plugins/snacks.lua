return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- efficiency
			bigfile = { enabled = true },
			quickfile = { enabled = true, notify = true },
			-- interactioin/UI
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{
						section = "terminal",
						cmd = "pokemon-colorscripts -r 1 --no-title; sleep .1",
						random = 10,
						pane = 2,
						indent = 4,
						height = 30,
					},
				},
			},
			explorer = { enabled = true },
			picker = {
				enabled = true,
				sources = {
					files = { hidden = true },
					grep = { hidden = true },
					explorer = { hidden = true },
				},
			},
			input = { enabled = true },
			notifier = { enabled = true, timeout = 9000 },
			indent = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			scope = { enabled = true },
			words = {
				enabled = true,
				notify_jump = true,
				notify_end = true,
				foldopen = true,
				jumplist = true,
				modes = { "n", "i", "c" },
			},
			-- tools
			lazygit = { enabled = true },
			bufdelete = { enabled = true },
			terminal = { enabled = true },

			styles = {
				notification = {
					-- wo = { wrap = true },
				},
			},
		},
		keys = {
			-- ========== Picker / Explorer ==========
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Snacks Smart Find Files",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Snacks [F]ind [F]iles",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Snacks [F]ind [B]uffers",
			},
			{
				"<leader>fG",
				function()
					Snacks.picker.grep()
				end,
				desc = "Snacks [F]ind [G]rep",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Snacks [F]ind [G]rep Open Buffer",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Snacks [F]ind Visual Selection or [W]ord",
			},
			{
				"<leader>f:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Snacks [F]ind [:]Command History",
			},
			{
				"<leader>fn",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Snacks [F]ind [N]otifications",
			},
			{
				"<leader>fe",
				function()
					Snacks.explorer()
				end,
				desc = "Snacks File [E]xplorer",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Snacks [F]ind [P]rojects",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Snacks [F]ind [R]ecent Files",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "Snacks [F]ind Buffer [L]ines",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Snacks [F]ind [H]elp Pages",
			},
			{
				"<leader>fk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Snacks [F]ind [K]eymaps",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Snacks [F]ind [C]olorschemes",
			},
			-- ========== Git ==========
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "LazyGit",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Snacks [G]it [B]rowse",
				mode = { "n", "v" },
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Snacks Find [G]it [F]iles",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Snacks [G]it [S]tatus",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Snacks [G]it [L]og",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Snacks [G]it [D]iff",
			},
			-- ========== LSP ==========
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Snacks Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Snacks Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "Snacks References",
			},
			{
				"gi",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Snacks Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Snacks Goto T[y]pe Definition",
			},
			{
				"gai",
				function()
					Snacks.picker.lsp_incoming_calls()
				end,
				desc = "Snacks C[a]lls [I]ncoming",
			},
			{
				"gao",
				function()
					Snacks.picker.lsp_outgoing_calls()
				end,
				desc = "Snacks C[a]lls [O]utgoing",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Snacks LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Snacks LSP Workspace Symbols",
			},

			-- ========== 通知 ==========
			-- {
			--   "<leader>n",
			--   function()
			--     Snacks.notifier.show_history()
			--   end,
			--   desc = "Notification History",
			-- },
			-- {
			--   "<leader>un",
			--   function()
			--     Snacks.notifier.hide()
			--   end,
			--   desc = "Dismiss All Notifications",
			-- },

			-- ========== 终端 ==========
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "[T]oggle [T]erminal",
			},
			-- {
			--   "<c-_>",
			--   function()
			--     Snacks.terminal()
			--   end,
			--   desc = "which_key_ignore",
			-- },

			-- ========== 小工具 ==========
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bo",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete Other Buffer",
			},
			{
				"<leader>cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},

			-- ========== LSP references 快速跳转 (words) ==========
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},

		init = function()
            -- create toggles for some common option
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle.treesitter():map("<leader>uT")
				end,
			})
		end,
	},
}
