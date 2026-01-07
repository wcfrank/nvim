local keymap = vim.keymap

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<leader>wh", "<C-w>h")
keymap.set("n", "<leader>wl", "<C-w>l")
keymap.set("n", "<leader>wj", "<C-w>j")
keymap.set("n", "<leader>wk", "<C-w>k")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- -- 切换buffer
-- keymap.set("n", "<C-L>", ":bnext<CR>")
-- keymap.set("n", "<C-H>", ":bprevious<CR>")

-- -- telescope
-- local builtin = require('telescope.builtin')
-- keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- keymap.set('n', '<leader>fj', builtin.current_buffer_fuzzy_find, { desc = 'Telescope current buffer fuzzy find'})

-- Persistence
keymap.set("n", "<leader>qs", require("persistence").load, { desc = "Restore last session" })
