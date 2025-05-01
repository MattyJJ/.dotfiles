return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "lua_ls",
        "ts_ls",
        "pyright"
      },
      automatic_installation = true,
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "black",        -- python formatter
        "prettier",     -- typescript formatter
        "stylua",       -- lua formatter
        "gofumpt",      -- go formatter
        "clang_format", -- c/c++ formatter
      },
      automatic_installation = true,
    },
  },
}
