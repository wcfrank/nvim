-- Python LSP: basedpyright
vim.lsp.config["basedpyright"] = {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	-- root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		basedpyright = {
			disableOrganizeImports = true, -- 让 Ruff 来处理导入
			analysis = {
				typeCheckingMode = "off", -- 可改 "standard", "strict"
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
}
vim.lsp.enable("basedpyright")

-- Lua LSP: Lua-language-server
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	-- root_markers = {
	--     ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git"
	-- },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
vim.lsp.enable("lua_ls")

-- JSON LSP: jsonls
vim.lsp.config["jsonls"] = {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	init_options = { provideFormatters = true },
}
vim.lsp.enable("jsonls")

-- Markdown LSP: marksman
vim.lsp.config["marksman"] = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
}
vim.lsp.enable("marksman")

-- Global diagnostics configuration (native LSP UI)
vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●●" },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded" },
})

-- Buffer-local LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(evnt) -- arg: event
		local bufnr = evnt.buf

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {
			buffer = evnt.buf,
			silent = true,
			desc = "LSP: hover",
		})
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
		--   buffer = evnt.buf, silent = true, desc = "LSP: Go to definition"
		-- })
		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
		--   buffer = evnt.buf, silent = true, desc = "LSP: Go to declaration"
		-- })
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
		--   buffer = evnt.buf, silent = true, desc = "LSP: Go to implementation"
		-- })
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {
		--   buffer = evnt.buf, silent = true, desc = "LSP: Go to Reference"
		-- })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
			buffer = evnt.buf,
			silent = true,
			desc = "LSP: Rename",
		})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
			buffer = evnt.buf,
			silent = true,
			desc = "LSP: Code action",
		})
		-- vim.keymap.set("n", "<leader>lf", function()
		--   vim.lsp.buf.format({ async = false })
		-- end, { buffer = evnt.buf, silent = true, desc = "LSP: Format" })

		-- Inlay hints when supported (Neovim 0.11+)
		-- if vim.lsp.inlay_hint then
		--   vim.lsp.inlay_hint.enable(true, { bufnr = evnt.buf })
		-- end
	end,
})
