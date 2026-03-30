vim.pack.add({
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/BurntSushi/ripgrep',
})

vim.keymap.set("n", "<leader>t", "", { desc = "Telescope" })
vim.keymap.set("n", "<leader>tp", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>tf", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>tg", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")

-- Open Telescope file finder with Ctrl+p
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>") -- Dropped hidden=true from the command - let's see if we can live without it
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>Telescope buffers<CR>")

vim.keymap.set("n", "<C-g>", ":Telescope git_status<CR>")
