-- These values are recommended when neominimap layout == "float"
vim.opt.wrap = false
vim.opt.sidescrolloff = 36 -- Set a large value

-- Disable Codeium by default (toggle with <leader>sa)
vim.api.nvim_create_autocmd("VimEnter", { command = "Codeium Toggle" })

-- Automatically read changes in real time as files are updated
vim.opt.autoread = true
