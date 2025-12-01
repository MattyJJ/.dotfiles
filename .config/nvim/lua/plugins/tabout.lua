return {
    'abecodes/tabout.nvim',
    event = 'InsertEnter',
    config = function()
        require('tabout').setup {
            tabkey = '<Tab>',
            backwards_tabkey = '<S-Tab>',
            act_as_tab = true,
            act_as_shift_tab = false,
            enable_backwards = true,
            completion = true,
            tabouts = {
                { open = '(', close = ')', skip_if_empty = false },
                { open = '[', close = ']', skip_if_empty = false },
                { open = '{', close = '}', skip_if_empty = false },
                { open = "'", close = "'", skip_if_empty = false },
                { open = '"', close = '"', skip_if_empty = false },
            },
        }
    end
}
