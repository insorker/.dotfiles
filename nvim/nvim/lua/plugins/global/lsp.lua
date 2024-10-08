-- more servers: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
local servers_default = {
  -- script
  "lua_ls", "bashls", "jsonls",
  -- note
  "marksman",
  -- c, c++
  "clangd", "cmake",
  -- python
  "pyright",
  -- docker
  "dockerls",
  -- rust
  "rust_analyzer",
}

return {
  {
    "neovim/nvim-lspconfig",    -- Collection of configurations for built-in LSP client
    dependencies = {
      -- automatic server installation
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- autocompletion
      "hrsh7th/nvim-cmp",         -- Autocompletion plugin
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "L3MON4D3/LuaSnip",         -- Snippets plugin
      "hrsh7th/cmp-nvim-lsp-signature-help", -- function hint
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup{
        ensure_installed = servers_default,
      }

      -- more information :h mason-lspconfig-automatic-server-setup
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          local lspconfig = require('lspconfig')
          -- Add additional capabilities supported by nvim-cmp
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          lspconfig[server_name].setup {
            -- on_attach = my_custom_on_attach,
            capabilities = capabilities,
          }
        end,
      }

      -- more information: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp

      -- luasnip setup
      local luasnip = require('luasnip')
      -- nvim-cmp setup
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }, {
          { name = 'nvim_lsp_signature_help' },
        })
      }

      -- https://www.reddit.com/r/neovim/comments/114tc35/beginner_trigger_suggestions_in_neovim/
      -- vim.keymap.set('n', '<Space>k', vim.diagnostic.open_float)
      vim.keymap.set('n', '<Space>k', vim.lsp.buf.hover)
    end
  }
}
