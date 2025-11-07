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

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})
