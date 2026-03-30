vim.pack.add({
    -- UI
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/refractalize/oil-git-status.nvim',
})

require('oil').setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = "fast", -- maybe set to true
        is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
        end,
    },
    win_options = {
        signcolumn = "yes:2",
    },
    keymaps = {
        ["<Esc>"] = { "actions.close", mode = "n" },
    },
    float = {
        padding = 8,
    },
})

require('oil-git-status').setup({
    show_ignored = false,
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Edit directory in Oil buffer" })
