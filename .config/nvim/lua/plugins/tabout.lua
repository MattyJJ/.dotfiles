return {
  'abecodes/tabout.nvim',
  event = 'InsertEnter',
  config = function()
    require('tabout').setup {
      tabkey = '<Tab>',             -- key to jump out of pair
      backwards_tabkey = '<S-Tab>', -- optional backward jump
      act_as_tab = true,            -- use tab for its usual purpose when no jump available
      act_as_shift_tab = false,     -- behaviour for shift‑tab
      enable_backwards = true,      -- allow jumping backwards
      completion = true,            -- enable tabout alongside completion plugin
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

