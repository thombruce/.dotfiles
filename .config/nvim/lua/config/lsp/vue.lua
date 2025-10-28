-- TODO: Also enable the pug-lsp language server (installed via Mason but we need the LSP config here too, I presume).

local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
    '/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
      {
        name = '@vue/language-plugin-pug',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {}

-- nvim 0.11 or above
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({ 'ts_ls', 'vue_ls' }) -- If using `ts_ls` replace `vtsls` to `ts_ls`
