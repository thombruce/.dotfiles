return {
  -- Blink completion engine - might interfere with LSP completions?
  -- An alternative is nvim-cmp, but blink is in active development and
  -- technically should be faster. It is billed as a Rust-based alternative
  -- to the Lua-backed nvim-cmp.
  {
    'saghen/blink.cmp',
    enabled = true,
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'Exafunction/windsurf.nvim',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'super-tab' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        list = {
          selection = {
            -- TODO: This is true by default but pre-selection interferes with AI
            --       completion. It would be nice to have it be true when AI is disabled.
            preselect = false,
            auto_insert = true,
          }
        },
        menu = {
          -- auto_show = false,

          direction_priority = { 'n', 's' },
          -- NOTE: This is a simpler way to avoid conflicts with Windsurf's virtual_text
          --       The below provides a more sophisticated solution that only works with
          --       Blink's own ghost_text. But we can access the vim context, so...
          --       Perhaps there is a way to modify it for dual-compatibility.
          -- As of now, we have completion menu above and ghost/virtual text below.

          -- Source: https://cmp.saghen.dev/recipes.html#avoid-multi-line-completion-ghost-text
          -- direction_priority = function()
          --   local ctx = require('blink.cmp').get_context()
          --   local item = require('blink.cmp').get_selected_item()
          --   if ctx == nil or item == nil then return { 's', 'n' } end

          --   local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
          --   local is_multi_line = item_text:find('\n') ~= nil

          --   -- after showing the menu upwards, we want to maintain that direction
          --   -- until we re-open the menu, so store the context id in a global variable
          --   if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
          --     vim.g.blink_cmp_upwards_ctx_id = ctx.id
          --     return { 'n', 's' }
          --   end
          --   return { 's', 'n' }
          -- end,
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        providers = {
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        }
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
