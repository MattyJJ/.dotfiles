return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " 🔒",
              unnamed = "[No Name]",
            },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { { "progress", icon = "☰" } },
        lualine_z = {
          function()
            return "󰥔 " .. os.date("%I:%M %p")
          end,
        },
      },
      extensions = { "lazy", "nvim-tree", "quickfix", "trouble", "fugitive" },
    })
  end,
}
