local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>h", "", { desc = "Harpoon" })

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add" })
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "List" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- NOTE: The below keybindings /would/ instantly navigate to harpooned
--       files 1, 2, 3 and 4, but these keybindings (the first of which
--       is modified from the default recommendation of <C-h> as I use this
--       elsewhere) are sort of... nonsensical to me, right?
--       - o (or h) for first? i suppose 'h' was for 'harpoon'.
--       - t for two? sure.
--       - n for three?
--       - s for four?
--       I wonder, could we use numbers instead...
-- vim.keymap.set("n", "<C-o>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- NOTE: So... some of the <C-[1..4]> keys do do something...
--       <C-2> navigates a bit like <S-w> (hard word-start) for some reason
--       <C-4> opens the terminal (identical to a custom bind I have, <C-\>)

-- NOTE: I tried to overwite the C-# keys anyway, to no avail.
--       I also tried adding SHIFT, but this conflicts directly with some Kitty
--       keybinds. So... I'm just going to map these to leader keys instead.
--       <leader>h (for harpoon) seems like a good base, then we'll just use the
--       numbers.
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end)
vim.keymap.set("n", "<leader>h0", function() harpoon:list():select(10) end)

-- Toggle previous & next buffers stored within Harpoon list
-- NOTE: Disabled, as these also appear to conflict with other keymaps outside of Neovim
-- vim.keymap.set("n", "<C-S-B>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
