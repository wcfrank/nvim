return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install && git restore yarn.lock", -- NOTE: node version should be v20, latest version not working
		init = function()
			vim.cmd([[
                function! MkdpOpen(url) abort
                  call jobstart(['open',a:url], {'detach': v:true})
                endfunction
            ]])
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_browser = ""
			vim.g.mkdp_browserfunc = "MkdpOpen"
			vim.g.mkdp_preview_options = {
				katex = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
			}
		end,
		keys = {
			{ "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", desc = "[M]ark[D]own Toggle" },
		},
	},
}
