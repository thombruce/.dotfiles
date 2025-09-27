-- Recognise todo.txt and similar files as todotxt filetype
vim.filetype.add({
  extension = {
    toodles = "todotxt",
  },
  filename = {
    ["todo.txt"] = "todotxt",
  },
  pattern = {
    [".*%.todo%.txt"] = "todotxt",
  },
})
