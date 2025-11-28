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
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })
            if #bufs > 1 then
                vim.cmd('bprevious')
                vim.cmd('bdelete #')
            else
                vim.cmd('bdelete!')
            end
        end, 'Close current buffer')

        for i = 1, 9 do
            noremap('<A-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>')
        end
    end,
}
