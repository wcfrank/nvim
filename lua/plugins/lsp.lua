return {
	-- Mason core
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = true,
		-- opts = {
		--   providers = {
		--     github = {
		--       download = "curl", -- prefer curl over wget
		--     },
		--   },
		--   -- optional: make Mason more verbose for debugging
		--   log_level = vim.log.levels.INFO,
		-- },
	},

	-- Mason LSP bridge
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"basedpyright", -- Python LSP
				"lua_ls", -- Lua LSP
				"jsonls", -- JSON LSP
				"marksman", -- Markdown LSP
			},
			automatic_installation = true,
		},
	},

	-- Mason Linter/Formatter Installation
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- lazy = false,
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua", -- Lua Linter
				"ruff", -- Python Linter
				"markdownlint-cli2", -- Markdown Linter
			},
		},
	},

	-- conform
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				markdown = { "markdownlint-cli2" },
			},
			format_on_save = false,
		},
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({
						lsp_fallback = true, -- using lsp formatting if not formatter
						async = false,
						timeout_ms = 2000,
					})
				end,
				mode = { "n", "v" },
				desc = "Format (Conform)",
			},
		},
	},
}
