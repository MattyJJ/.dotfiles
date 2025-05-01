Keymap = {}


local function smart_focus_nvim_tree()
  local api = require("nvim-tree.api")
  local view = require("nvim-tree.view")

  if view.is_visible() then
    if vim.fn.bufname() == "NvimTree_1" then
      -- if you're already in the tree, go to the next window
      vim.cmd("wincmd l")
    else
      -- focus the NvimTree window
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        if bufname:match("NvimTree_") then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end
  else
    -- open the tree if it's not open
    api.tree.open()
  end
end


function Keymap.SetupKeymaps()
  local wk = require("which-key")
  wk.setup()

  wk.add({
    {
      -- BUILTIN
      {
        mode = { "n" },

        -- SWITCH BETWEEN WINDOWS
        { "<C-h>",      "<C-w>h",                      silent = true },
        { "<C-j>",      "<C-w>j",                      silent = true },
        { "<C-k>",      "<C-w>k",                      silent = true },
        { "<C-l>",      "<C-w>l",                      silent = true },

        -- SHIFT CURRENT LINE
        { "<A-j>",      "<Cmd>m .+1<CR>==",            silent = true },
        { "<A-k>",      "<Cmd>m .-2<CR>==",            silent = true },

        -- UNDO & REDO
        { "<C-z>",      "u",                           silent = true },
        { "<C-S-z>",    "<C-r>",                       silent = true },

        -- QUIT'n and WRITE'n
        { "<C-q>",      "<Cmd>q<CR>",                  silent = true },
        { "<C-s>",      "<Cmd>w<CR>",                  silent = true },

        { "<C-A-q>",    "<Cmd>qa<CR>",                 silent = true },
        { "<C-A-s>",    "<Cmd>wa<CR>",                 silent = true },

        -- SYSTEM COPY
        { "<C-c>",      '"+y',                         silent = true },


        -- WINDOW RESIZE'n
        { "<C-Up>",     "<Cmd>resize -2<CR>",          silent = true },
        { "<C-Down>",   "<Cmd>resize +2<CR>",          silent = true },
        { "<C-Left>",   "<Cmd>vertical resize -2<CR>", silent = true },
        { "<C-Right>",  "<Cmd>vertical resize +2<CR>", silent = true },

        -- WINDOW SPLITTING
        { "<leader>sv", "<Cmd>vsplit<CR>",             silent = true },
        { "<leader>sh", "<Cmd>split<CR>",              silent = true },

        -- CENTERED HALF PAGE JUMPS
        { "<C-d>",      "<C-d>zz",                     silent = true },
        { "<C-U>",      "<C-u>zz",                     silent = true },

        -- FASTER NAVIGATION (KINDA)
        { "H",          "gE",                          silent = true },
        { "L",          "w",                           silent = true },
      },
      {
        mode = { "v" },

        -- SHIFT SELECTED LINES
        { "<A-j>", "<Cmd>m '>+1<CR>gv=gv", silent = true },
        { "<A-k>", "<Cmd>m '<-2<CR>gv=gv", silent = true },

        -- FASTER NAVIGATION (KINDA)
        { "H",     "gE",                   silent = true },
        { "L",     "w",                    silent = true },
      },
    },

    -- PLUGINS
    {
      {
        mode = { "n" },

        -- UNDO TREE
        { "<leader>u",  function() vim.cmd.UndotreeToggle() end },

        -- TREE
        { "<leader>e",  function() smart_focus_nvim_tree() end },
        { "<leader>E",  "<Cmd>NvimTreeToggle<CR>",                                       desc = "Toggles the file explorer from nvim-tree" },

        -- COMMENT.NVIM
        { "<C-_>",      '<Cmd>lua require("Comment.api").toggle.linewise.current()<CR>', silent = true },

        -- TELESCOPE
        { "<leader>fp", "<Cmd>Telescope find_files<CR>",                                 desc = "Find project files with telescope" },
        { "<leader>fg", "<Cmd>Telescope live_grep<CR>",                                  desc = "grep project with telescope" },
        { "<leader>fG", "<Cmd>Telescope git_files<CR>",                                  desc = "Search through git repository with telescope" },
      },
      {
        mode = { "v" },

        -- COMMENT.NVIM
        { "<C-_>", '<Esc><Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', silent = true },
      },
    },
  })
end

return Keymap
