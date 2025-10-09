-- Set leader key to space bar for quick access to custom
-- operations
vim.g.mapleader = " "

-- Set the clipboard so that [y]ank, [d]elete and [p]aste
-- operations will use the system clipboard
-- (requires win32yank to be installed on Windows)
vim.opt.clipboard = "unnamedplus"

-- Quick Quit or Close Current Pane/Window
vim.keymap.set("n", "<C-q>", "<CMD>quit<CR>")

-- Split/Pane Navigation
vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-w>l')
-- And Split/Pane creation
vim.keymap.set('n', '<C-g>', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<C-b>', '<CMD>split<CR>')

vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

vim.keymap.set("n", "<leader>/", "", { desc = "Search" })
vim.keymap.set("n", "<leader>/n", "/", { desc = "Search in buffer" })
vim.keymap.set("n", "<leader>/x", ":noh<CR>", { desc = "Clear search" })

vim.keymap.set("n", "<leader>fa", ":RainbowAlign<CR>") -- fa = "format" -> "align"
-- TODO: RainbowAlign should only be bound to keys when viewing a CSV document.
--       You should setup an autocmd to map the key when viewing a CSV file.
--       You should also look into the use of { noremap = true, silent = true } options.
--       What do these actually do? Specifically, what does noremap do? Is it useful?
--       Intuitively, I guess that it means "don't allow this to be remapped" by some
--       other utility. But I could be wrong about that.

vim.keymap.set("n", "<leader>g", "<CMD>Neogit<CR>")
-- vim.keymap.set("n", "<leader>gc", "<CMD>Neogit commit<CR>")
-- vim.keymap.set("n", "<leader>ga", "<CMD>Neogit stage<CR>")
-- vim.keymap.set("n", "<leader>gs", "<CMD>Neogit<CR>")
-- vim.keymap.set("n", "<leader>gs", "<CMD>Neogit<CR>")
-- vim.keymap.set("n", "<leader>gs", "<CMD>Neogit<CR>")
-- vim.keymap.set("n", "<leader>gs", "<CMD>Neogit<CR>")
vim.keymap.set("n", "<leader>d", "", { desc = "Diffview" })
vim.keymap.set("n", "<leader>dv", "<CMD>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dx", "<CMD>DiffviewClose<CR>") -- TODO: We only need this when Diffview is open

vim.keymap.set("n", "<leader>t", "", { desc = "Telescope" })
vim.keymap.set("n", "<leader>tp", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>tf", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>tg", ":Telescope grep_string<CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")
-- vim.keymap.set("n", "<leader>t", ":Telescope <CR>")

vim.keymap.set("n", "<leader>p", "", { desc = "Play" })
vim.keymap.set("n", "<leader>pg", ":Golf easy<CR>") -- ":Golf today" is broken
vim.keymap.set("n", "<leader>ps", ":SnakeStart<CR>")
-- vim.keymap.set("n", "<leader>gt", ":Tetris<CR>") -- Disabled since it doesn't use HJKL
vim.keymap.set("n", "<leader>pb", ":BlackJackNewGame<CR>")
vim.keymap.set("n", "<leader>pn", ":Sudoku<CR>")
vim.keymap.set("n", "<leader>pm", ":Nvimesweeper<CR>")
vim.keymap.set("n", "<leader>pcr", ":CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>pcl", ":CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<leader>pcs", ":CellularAutomaton scramble<CR>")

-- Next and Previous Buffer on Tab and Shift+Tab
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "<C-m>", ":bnext<CR>")
vim.keymap.set("n", "<C-n>", ":bprev<CR>")

-- Open Telescope file finder with Ctrl+p
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>") -- Dropped hidden=true from the command - let's see if we can live without it

-- Open Terminal with Ctrl+m
-- Unnecessary, as ToggleTerm can be opened with the enter key
-- vim.keymap.set("n", "<C-m>", ":ToggleTerm<CR>")
-- ...but commenting that out removes the enter option. Weird.
vim.keymap.set("n", [[<C-\>]], ":ToggleTerm<CR>")

-- Open Oil File Explorer / Editor with "-" key
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Open Neogit with Ctrl+g
-- vim.keymap.set("n", "<C-g>", ":Neogit<CR>") -- CONFLICT with new bnext mapping

----
-- Keymappings for ToggleTerm to be applied only when using the Terminal
----
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set({ 't', 'n' }, '<esc>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
  -- see https://github.com/akinsho/toggleterm.nvim for additional values you may want to set.
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
----
