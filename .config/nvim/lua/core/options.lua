-- General/UI
vim.o.termguicolors = true             -- Enable true color support
vim.o.number = true                    -- Absolute line number for current line
vim.o.relativenumber = true            -- Relative line numbers
vim.o.numberwidth = 4                  -- Number column width
vim.o.cursorline = true                -- Highlight current line
vim.o.showmode = false
vim.o.showtabline = 2                  -- Always show tabline
vim.o.cmdheight = 0                    -- Command line height
vim.o.scrolloff = 4                    -- Keep lines visible above/below cursor
vim.o.sidescrolloff = 8                -- Keep columns visible horizontally
vim.o.wrap = false                     -- Disable line wrap
vim.o.linebreak = true                 -- Wrap at word boundaries
vim.o.whichwrap = 'bs<>[]hl'           -- Allow cursor to wrap with these keys
vim.o.mouse = 'a'                      -- Enable mouse support
vim.opt.signcolumn = "yes"             -- Always show the sign column (prevents text from shifting)
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'    -- Ensure clipboard is synced with OS after startup
end)

-- Editing/Indentation
vim.o.expandtab = true                 -- Convert tabs to spaces
vim.o.shiftwidth = 4                   -- Indent width
vim.o.tabstop = 4                      -- Tab width
vim.o.softtabstop = 4                  -- Soft tab width
vim.o.smartindent = true               -- Smart auto-indenting
vim.o.autoindent = true                -- Copy indent from previous line
vim.o.backspace = 'indent,eol,start'   -- More permissive backspace
vim.o.breakindent = true               -- Enable break indent
vim.opt.iskeyword:append '-'           -- Include hyphen in word motions

-- Searching/Completion
vim.o.hlsearch = false                 -- Disable search highlight
vim.o.ignorecase = true                -- Case-insensitive search...
vim.o.smartcase = true                 -- ...unless uppercase in search
vim.o.completeopt = 'menuone,noselect' -- Completion menu behavior
vim.o.pumheight = 10                   -- Completion menu height
vim.opt.shortmess:append 'c'           -- Reduce completion messages

-- Files/Backups/Undo
vim.o.undofile = true                  -- Persist undo history
vim.o.backup = false                   -- Disable backup files
vim.o.writebackup = false              -- Disable write backup
vim.o.swapfile = false                 -- Disable swap files
vim.o.fileencoding = 'utf-8'           -- File encoding
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins

-- Splits/Windows
vim.o.splitbelow = true                -- Horizontal splits go below
vim.o.splitright = true                -- Vertical splits go right

-- Performance/Timing
vim.o.updatetime = 250                 -- Faster completion & CursorHold events
vim.o.timeoutlen = 300                 -- Key sequence timeout in ms

vim.g.lazyvim_prettier_needs_config = false
