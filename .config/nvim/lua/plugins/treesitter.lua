return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua', 'c', 'cpp', 'python', 'bash',
        'json', 'html', 'css', 'javascript',
        'vim', 'markdown', 'go', 'java',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}

