return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        icons = {
          show = {
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            picker = "last_focused"
          }
        }
      }
    })
  end,
}
