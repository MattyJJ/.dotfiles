vim.g.mapleader = ' '

vim.g.maplocalleader = '\\'


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

-- searching

nremap('n', 'nzzzv')
nremap('N', 'Nzzzv')

nremap('<Esc>', '<Cmd>nohlsearch<CR>', 'clear search highlight')
nremap('<leader>nh', '<Cmd>set hlsearch!<CR>', 'toggle search highlight')


-- WINDOW CONTROLS


nremap('<leader>sv', '<Cmd>vsplit<CR>')
nremap('<leader>sh', '<Cmd>split<CR>')


nremap('<C-h>', '<C-w>h')
nremap('<C-j>', '<C-w>j')

nremap('<C-k>', '<C-w>k')
nremap('<C-l>', '<C-w>l')


nremap('<D-Up>', '<Cmd>resize -2<CR>')
nremap('<D-Left>', '<Cmd>vertical resize -2<CR>')

nremap('<D-Right>', '<Cmd>vertical resize +2<CR>')
nremap('<D-Down>', '<Cmd>resize +2<CR>')


-- TEXT MANIPULATION

nremap('<D-j>', '<Cmd>m .+1<CR>==', 'Shift current line up')
nremap('<D-k>', '<Cmd>m .-2<CR>==', 'Shift current line down')


vremap('<D-j>', "<Cmd>m '>+1<CR>gv=gv", 'Shift selection up')
vremap('<D-k>', "<Cmd>m '<-2<CR>gv=gv", 'Shift selection down')

vremap('<', '<gv')
vremap('>', '>gv')

vremap('<leader>p', '"_dP')



nremap('<leader>rn', function() vim.lsp.buf.rename() end)
