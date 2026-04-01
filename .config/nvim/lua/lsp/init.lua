-- NOTE: Use Mason to install LSPs and enable them here
vim.lsp.enable({
  'bashls',
  'cssls',
  'lua_ls',
  'pug',
  'ruby_lsp',
  'rust_analyzer',
  'shopify_theme_ls',
  'tailwindcss',
  'tinymist',
  'ts_ls',
  'vue_ls',
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
})
