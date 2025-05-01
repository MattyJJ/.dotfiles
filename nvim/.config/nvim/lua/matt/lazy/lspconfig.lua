return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(client, bufnr)
      local bufmap = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- 🧭 Keymaps
      bufmap("n", "gd", vim.lsp.buf.definition, "[LSP] Go to definition")
      bufmap("n", "K", vim.lsp.buf.hover, "[LSP] Hover info")
      bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
      bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code action")
      bufmap("n", "gr", vim.lsp.buf.references, "[LSP] References")
      bufmap("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
      end, "[LSP] Format")

      -- 🧼 Format on save if supported
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end

    -- Capabilities with cmp completion and signature help
    local capabilities = cmp_nvim_lsp.default_capabilities()

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end,
    }

    -- 💡 Better diagnostics
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
