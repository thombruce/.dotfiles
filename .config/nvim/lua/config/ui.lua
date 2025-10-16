-- Show line number and numbers relative to current line in buffer
vim.wo.number = true
vim.wo.relativenumber = true

-- Hides the command line when not in active use
-- (This might be redundant since installing Noice? ... But we might get rid of Noice)
vim.o.cmdheight = 0

-- Set default border for floating windows
vim.opt.winborder = "rounded"
