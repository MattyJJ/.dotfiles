
function remap(mode, keybind, callback, desc)
  vim.keymap.set(mode, keybind, callback, { desc = desc })
end

function noremap(keybind, callback, desc)
  remap('n', keybind, callback, desc)
end

function voremap(keybind, callback, desc)
  remap('v', keybind, callback, desc)
end



-- NAVIGATION

noremap('H', 'gE')
noremap('L', 'w')

voremap('H', 'gE')
voremap('L', 'w')

noremap('<C-d>', '<C-d>zz')
noremap('<C-u>', '<C-u>zz')

-- WINDOW CONTROLS

noremap('<leader>sv', '<Cmd>vsplit<CR>')
noremap('<leader>sh', '<Cmd>split<CR>')

noremap('<C-h>', '<C-w>h')
noremap('<C-j>', '<C-w>j')
noremap('<C-k>', '<C-w>k')
noremap('<C-l>', '<C-w>l')

noremap('<A-Up>', '<Cmd>resize -2<CR>')
noremap('<A-Left>', '<Cmd>vertical resize -2<CR>')
noremap('<A-Right>', '<Cmd>vertical resize +2<CR>')
noremap('<A-Down>', '<Cmd>resize +2<CR>')

-- SHIFTING

noremap('<A-j>', '<Cmd>m .+1<CR>==', 'Shift current line up')
noremap('<A-k>', '<Cmd>m .-2<CR>==', 'Shift current line down')

voremap('<A-j>', "<Cmd>m '>+1<CR>gv=gv", 'Shift selection up')
voremap('<A-k>', "<Cmd>m '<-2<CR>gv=gv", 'Shift selection down')
