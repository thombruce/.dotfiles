-- Set leader key to space bar for quick access to custom
-- operations
vim.g.mapleader = " "

-- Set the clipboard so that [y]ank, [d]elete and [p]aste
-- operations will use the system clipboard
-- (requires win32yank to be installed on Windows)
vim.opt.clipboard = "unnamedplus"

-- Quick Quit or Close Current Pane/Window
vim.keymap.set("n", "<C-q>", "<CMD>quit<CR>")

-- Use Esc to enter insert mode as well as exit (treat it like a toggle)
vim.keymap.set("n", "<Esc>", "i")

-- Split/Pane Navigation
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w>l')
-- And Split/Pane creation
vim.keymap.set('n', '<C-y>', '<CMD>vsplit<CR>')
-- vim.keymap.set('n', '<C-u>', '<CMD>split<CR>')
-- NOTE: Conflicts with default half-page up motion
--       I'm just disabling it for now, as I don't use splits
--       in Neovim that much anyway, top/botton splits even less!

vim.keymap.set("n", "<leader>s", "", { desc = "Settings" })
vim.keymap.set("n", "<leader>sa", "<CMD>Codeium Toggle<CR>", { desc = "Toggle AI" })

-- vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })

-- vim.keymap.set("n", "<leader>w", "", { desc = "Writing modes..." })
vim.keymap.set("n", "<leader>sc", ":NoNeckPain<CR>", { desc = "Toggle NoNeckPain" })
vim.keymap.set("n", "<leader>sz", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>/", "", { desc = "Search" })
vim.keymap.set("n", "<leader>/n", "/", { desc = "Search in buffer" })
vim.keymap.set("n", "<leader>/x", ":noh<CR>", { desc = "Clear search" })

vim.keymap.set("n", "<leader>f", "", { desc = "Format" })
vim.keymap.set("n", "<leader>fa", ":RainbowAlign<CR>") -- fa = "format" -> "align"
-- TODO: RainbowAlign should only be bound to keys when viewing a CSV document.
--       You should setup an autocmd to map the key when viewing a CSV file.
--       You should also look into the use of { noremap = true, silent = true } options.
--       What do these actually do? Specifically, what does noremap do? Is it useful?
--       Intuitively, I guess that it means "don't allow this to be remapped" by some
--       other utility. But I could be wrong about that.

vim.keymap.set("n", "<leader>g", "", { desc = "Git" })
vim.keymap.set("n", "<leader>gd", "<CMD>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gx", "<CMD>DiffviewClose<CR>") -- TODO: We only need this when Diffview is open

vim.keymap.set("n", "<leader>t", "", { desc = "Telescope" })
vim.keymap.set("n", "<leader>tp", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>tf", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>tg", ":Telescope grep_string<CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")

-- Next and Previous Buffer on Tab and Shift+Tab
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "<C-n>", ":bnext<CR>")
vim.keymap.set("n", "<C-b>", ":bprev<CR>")

-- Open Telescope file finder with Ctrl+p
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>") -- Dropped hidden=true from the command - let's see if we can live without it
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<CR>")

-- Open Terminal with Ctrl+m
-- Unnecessary, as ToggleTerm can be opened with the enter key
-- vim.keymap.set("n", "<C-m>", ":ToggleTerm<CR>")
-- ...but commenting that out removes the enter option. Weird.
vim.keymap.set("n", [[<C-\>]], ":ToggleTerm<CR>")

-- Open Oil File Explorer / Editor with "-" key
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Open Diffview with Ctrl+g
vim.keymap.set("n", "<C-g>", ":DiffviewOpen<CR>")

-- Quicker Keybinds
vim.keymap.set("n", "<leader>q", function()
  require("quicker").toggle()
end, {
  desc = "Toggle quickfix",
})

vim.keymap.set("n", "<leader>l", function()
  require("quicker").toggle({ loclist = true })
end, {
  desc = "Toggle loclist",
})
