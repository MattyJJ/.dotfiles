return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('nvim-tree').setup({
            view = {
                width = 30,
                side = 'left',
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
                        picker = 'last_focused'
                    }
                }
            }
        })

        local function smart_focus_nvim_tree()
            local api = require('nvim-tree.api')
            local view = require('nvim-tree.view')

            if view.is_visible() then
                if vim.fn.bufname() == 'NvimTree_1' then
                    vim.cmd('wincmd l')
                else
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
                        if bufname:match('NvimTree_') then
                            vim.api.nvim_set_current_win(win)
                            break
                        end
                    end
                end
            else
                api.tree.open()
            end
        end

        nremap('<leader>e', function() smart_focus_nvim_tree() end)
        nremap('<leader>E', '<Cmd>NvimTreeToggle<CR>')
    end,
}
