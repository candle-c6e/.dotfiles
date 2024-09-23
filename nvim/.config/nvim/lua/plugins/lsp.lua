return {
  {
    "simrat39/inlay-hints.nvim",
  },
  {
    "j-hui/fidget.nvim",
    event = "BufEnter",
  },
  {
    "folke/neodev.nvim",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = "🦊 ",
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
      "rafamadriz/friendly-snippets",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      "lukas-reineke/cmp-under-comparator",
    },

    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      local augroup = vim.api.nvim_create_augroup
      local CandleGroup = augroup("TheCandle", {})

      local autocmd = vim.api.nvim_create_autocmd
      local yank_group = augroup("HighlightYank", {})

      function R(name)
        require("plenary.reload").reload_module(name)
      end

      vim.filetype.add({
        extension = {
          templ = "templ",
        },
      })

      autocmd("TextYankPost", {
        group = yank_group,
        pattern = "*",
        callback = function()
          vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
          })
        end,
      })

      autocmd({ "BufWritePre" }, {
        group = CandleGroup,
        pattern = "*",
        command = [[%s/\s\+$//e]],
      })

      local disable_semantic_tokens = {
        lua = true,
      }

      autocmd("LspAttach", {
        group = CandleGroup,
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
          local opts = { buffer = 0 }

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      local lspconfig = require("lspconfig")

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        handlers = {

          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = "Lua 5.1" },
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  },
                },
              },
            })
          end,
          lspconfig.gleam.setup({}),
        },
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      local ls = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<S-K>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.filetype({ "sql" }, {
        sources = {
          {
            name = "vim-dadbod-completion",
          },
          {
            name = "buffer",
          },
        },
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
    end,
  },
}
