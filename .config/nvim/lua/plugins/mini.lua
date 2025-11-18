return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.pairs').setup()
        require('mini.icons').setup()
        require('mini.statusline').setup()
        require('mini.cursorword').setup()
        require('mini.indentscope').setup()


        -- COMMENT

        local comment = require('mini.comment')
        comment.setup()

        noremap('<C-c>', function()
            comment.toggle_lines(vim.fn.line('.'), vim.fn.line('.'))
        end, 'toggle commenting current line')

        voremap('<C-c>', function()
            local start_line = vim.fn.line('v')
            local selected_line = vim.fn.line('.')

            if start_line < selected_line then
                comment.toggle_lines(start_line, selected_line)
            else 
                comment.toggle_lines(selected_line, start_line)
            end
                
        end, 'toggle commenting of the current selection')

        local pick = require('mini.pick')

        -- PICK

        pick.setup()

        noremap('<leader>ft', function()
            pick.builtin.grep_live({ cwd = vim.fn.expand('%:p:h') })
        end)

        noremap('<leader>fp', function()
            pick.builtin.grep_live()
        end)

        noremap('<leader>ff', function()
            pick.builtin.files()
        end)
    end,
}


