return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons', 

  config = function()
    require('bufferline').setup({
      options = {
        number = 'ordinal',
        separator_style = 'thin',

        minimum_width = 12,

        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      }
    })

    noremap('<leader>q', function()
      vim.cmd('bprevious')
      vim.cmd('bdelete #')
    end, 'Close current buffer')

    for i = 1, 9 do
      noremap('<A-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>')
    end
  end,
}
