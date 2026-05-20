local keymap = vim.keymap.set
local s = { silent = true }

-- vim.g.mapleader = ' '

keymap({ 'n'}, '<Space>', '<Nop>')

-- Escape behavior
keymap('n', '<Esc>', ':noh<CR>', s)
keymap('n', '<F13>', ':noh<CR>', s)
keymap('c', '<F13>', '<Esc>', s)
keymap({ 'i', 'n', 'v', 'c' }, '<F13>', '<Esc>', s)

-- Escape behavior (tmux)
--  for whatever reason tmux reads my <F13> as <F15>
keymap('n', '<F15>', ':noh<CR>', s)
keymap('c', '<F15>', '<Esc>', s)
keymap({ 'i', 'n', 'v', 'c' }, '<F15>', '<Esc>', s)

-- Editing (blackhole register)
keymap({ "n", "v" }, "c", '"_c')
keymap("n", "C", '"_C')
keymap("n", "x", '"_x')
keymap("n", "s", '"_s')
keymap("v", "p", '"_dP')
keymap("i", "<C-Del>", '<C-o>"_dw')

-- Navigation
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})
keymap('n', '<leader>wr', '<cmd>set wrap!<CR>')

-- Indentation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move lines
keymap("n", "<A-j>", ":m .+1<CR>==", s)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", s)
keymap("n", "<A-k>", ":m .-2<CR>==", s)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", s)

-- Buffer management
keymap('n', '<Tab>', ':bnext<CR>', s)
keymap('n', '<S-Tab>', ':bprevious<CR>', s)
keymap('n', '<leader>x', ':Bdelete!<CR>', s)
keymap('n', '<leader>n', '<cmd>enew<CR>', s)
keymap('n', '<CR>', "m`o<Esc>``", s)
keymap('n', '<S-CR>', "m`O<Esc>``", s)

-- Document operations
keymap('n', "<leader>dy", ":%y<CR>")
keymap('n', "<leader>dd", ":%d<CR>", s)
keymap("n", "<leader>dr", ':%d _ | 0put +<CR>', s)
keymap('n', '<leader>dp', function()
    vim.fn.setreg('+', vim.fn.expand('%'))
end, { desc = "[P]ath [F]ile copy to clipboard" })

keymap('n', '<leader>de', function()
    local dir = vim.fn.expand('%:p:h')
    if dir == '' then dir = vim.fn.getcwd() end
    vim.fn.jobstart({'explorer', dir}, {detach = true})
end, {desc = "Open Explorer at file directory"})

-- File management
keymap({ 'n', 'i' }, '<C-s>', '<cmd>noa w<CR>', s)
keymap('n', '<leader>wo', '<cmd>noa w<CR>', s)
keymap('n', '<leader>ww', '<cmd>w<CR>', s)
keymap('n', '<C-q>', '<cmd>q<CR>', s)

-- Diagnostics
keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = "[D]iagnostics float" })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = "[Q]uickfix / diagnostics list" })

-- Window management
keymap('n', '<C-k>', ':wincmd k<CR>', s)
keymap('n', '<C-j>', ':wincmd j<CR>', s)
keymap('n', '<C-h>', ':wincmd h<CR>', s)
keymap('n', '<C-l>', ':wincmd l<CR>', s)

-- Window resizing
keymap('n', '<Up>', ':resize -2<CR>', s)
keymap('n', '<Down>', ':resize +2<CR>', s)
keymap('n', '<Left>', ':vertical resize +2<CR>', s)
keymap('n', '<Right>', ':vertical resize -2<CR>', s)

-- Plugins
keymap("n", "<leader>tt", ":lua require('toggle-checkbox').toggle()<CR>", s)
keymap("n", "<leader>ll", ":Leet list<CR>", s)
keymap("n", "<leader>lt", ":Leet test<CR>", s)
keymap("n", "<leader>ls", ":Leet submit<CR>", s)

