require('config.keymaps')

-- Show line number and numbers relative to current line in buffer
vim.wo.number = true
vim.wo.relativenumber = true

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Tab Settings (We prefer spaces!)
vim.o.expandtab = true   -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 2        -- num of space characters per tab
vim.o.shiftwidth = 2     -- spaces per indentation level

-- Set default border for floating windows
vim.opt.winborder = "rounded"

-- These values are recommended when neominimap layout == "float"
vim.opt.wrap = false
vim.opt.sidescrolloff = 36 -- Set a large value

-- Automatically read changes in real time as files are updated
vim.opt.autoread = true

-- Set the clipboard so that [y]ank, [d]elete and [p]aste
-- operations will use the system clipboard
-- (requires win32yank to be installed on Windows)
vim.opt.clipboard = "unnamedplus"

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

-- Recognise todo.txt and similar files as todotxt filetype
vim.filetype.add({
  extension = {
    toodles = "todotxt",
    todo = "todotxt",
    shop = "todotxt",
    list = "todotxt",
  },
  filename = {
    ["todo.txt"] = "todotxt",
  },
  pattern = {
    [".*%.todo%.txt"] = "todotxt",
  },
})

