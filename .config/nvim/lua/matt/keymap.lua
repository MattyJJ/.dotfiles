function remap(mode, keybind, callback, desc)
    vim.keymap.set(mode, keybind, callback, { desc = desc })
end

function nremap(keybind, callback, desc)
    remap('n', keybind, callback, desc)
end

function vremap(keybind, callback, desc)
    remap('v', keybind, callback, desc)
end

-- NAVIGATION

nremap('H', 'gE')
nremap('L', 'w')

vremap('H', 'gE')
vremap('L', 'w')

nremap('<C-d>', '<C-d>zz')
nremap('<C-u>', '<C-u>zz')

-- WINDOW CONTROLS

nremap('<leader>sv', '<Cmd>vsplit<CR>')
nremap('<leader>sh', '<Cmd>split<CR>')

nremap('<C-h>', '<C-w>h')
nremap('<C-j>', '<C-w>j')
nremap('<C-k>', '<C-w>k')
nremap('<C-l>', '<C-w>l')

nremap('<A-Up>', '<Cmd>resize -2<CR>')
nremap('<A-Left>', '<Cmd>vertical resize -2<CR>')
nremap('<A-Right>', '<Cmd>vertical resize +2<CR>')
nremap('<A-Down>', '<Cmd>resize +2<CR>')

-- SHIFTING

nremap('<A-j>', '<Cmd>m .+1<CR>==', 'Shift current line up')
nremap('<A-k>', '<Cmd>m .-2<CR>==', 'Shift current line down')

vremap('<A-j>', "<Cmd>m '>+1<CR>gv=gv", 'Shift selection up')
vremap('<A-k>', "<Cmd>m '<-2<CR>gv=gv", 'Shift selection down')

nremap('<leader>rn', function() vim.lsp.buf.rename() end)
