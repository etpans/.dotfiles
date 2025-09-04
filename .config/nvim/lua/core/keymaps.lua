-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Options
local opts = { noremap = true, silent = true }

-- General keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })        -- Disable spacebar
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)                             -- Escape clears search highlights
vim.keymap.set('n', 'x', '"_x', opts)                                      -- Delete without affecting registers
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })  -- Move up respecting wrapped lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })  -- Move down respecting wrapped lines
vim.keymap.set({'i', 'n', 'v', 'c'}, '<F13>', '<Esc>', opts)               -- F13 to escape modes
vim.keymap.set({'i', 'n', 'v', 'c'}, '<F15>', '<Esc>', opts)               -- F15 to escape modes
vim.keymap.set('i', '<S-Tab>', '<C-d>', opts)                              -- Shift+Tab inverse of Tab
vim.keymap.set('n', '<CR>', "m`o<Esc>``", opts)                            -- Enter opens new line below keeping cursor in place
vim.keymap.set('n', '<S-CR>', "m`O<Esc>``", opts)                          -- Shift+Enter opens above keeping cursor in place
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)              -- Toggle line wrap
vim.keymap.set('v', 'p', '"_dP', opts)                                     -- Paste over selection
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts)                   -- Yank to system clipboard
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down (normal mode)", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down (visual mode)", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up (normal mode)", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up (visual mode)", silent = true })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Diagnostics
local diagnostics_active = true
vim.keymap.set('n', '<leader>do', function()                               -- Toggle diagnostics
    diagnostics_active = not diagnostics_active
    if diagnostics_active then vim.diagnostic.enable(0) else vim.diagnostic.disable(0) end
end, opts)

vim.keymap.set('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics list' })

-- Window resizing
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)         -- Split vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)         -- Split horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)        -- Equalize splits
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts)    -- Close split
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)      -- Navigate splits
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Buffer management
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)         -- Next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)   -- Previous buffer
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)  -- Close buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts)  -- New buffer

-- Cancel search (/ or ?) with F13
vim.keymap.set("c", "<F13>", "<Esc>", { noremap = true, silent = true })

-- Clear search highlight in normal mode
vim.keymap.set("n", "<F13>", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)               -- Quit file

-- File management
vim.keymap.set('n', '<C-s>', '<cmd>noa w <CR>', opts)            -- Save without formatting
vim.keymap.set('n', '<leader>wo', '<cmd>noa w <CR>', opts)       -- Save without formatting
vim.keymap.set('n', '<leader>ww', '<cmd>w <CR>', opts)           -- Save with formatting

-- Notification management
vim.keymap.set("n", "<leader>nv", function()
    require("notify").history()
end, { desc = "[N]otify [V]iew" })
vim.keymap.set("n", "<leader>nd", function()
    require("notify").dismiss({ silent = true, pending = true })
end, { desc = "[N]otify [D]ismiss" })

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts)
vim.keymap.set('n', '<leader>-', '<C-x>', opts)

-- neo-tree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- alpha
vim.keymap.set('n', '<leader>da', '<Cmd>Alpha<CR>')
