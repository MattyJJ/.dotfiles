return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {},
  },
}

