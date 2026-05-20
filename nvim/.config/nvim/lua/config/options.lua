local opt = vim.opt

-- General/UI
opt.termguicolors = true             -- Enable true color support
opt.number = true                    -- Absolute line number for current line
opt.relativenumber = true            -- Relative line numbers
opt.numberwidth = 4                  -- Number column width
opt.cursorline = true                -- Highlight current line
opt.showmode = false
opt.scrolloff = 4                    -- Keep lines visible above/below cursor
opt.sidescrolloff = 8                -- Keep columns visible horizontally
opt.wrap = false                     -- Disable line wrap
opt.linebreak = true                 -- Wrap at word boundaries
opt.whichwrap = 'bs<>[]hl'           -- Allow cursor to wrap with these keys
opt.mouse = 'a'                      -- Enable mouse support
opt.signcolumn = "yes"               -- Always show the sign column (prevents text from shifting)
opt.fillchars:append({ eob = " " })
vim.schedule(function()
    opt.clipboard = 'unnamedplus'    -- Ensure clipboard is synced with OS after startup
end)

-- Editing/Indentation
opt.expandtab = true                 -- Convert tabs to spaces
opt.shiftwidth = 4                   -- Indent width
opt.tabstop = 4                      -- Tab width
opt.softtabstop = 4                  -- Soft tab width
opt.smartindent = true               -- Smart auto-indenting
opt.autoindent = true                -- Copy indent from previous line
opt.backspace = 'indent,eol,start'   -- More permissive backspace
opt.breakindent = true               -- Enable break indent
opt.iskeyword:append '-'             -- Include hyphen in word motions

-- Searching/Completion
opt.hlsearch = false                 -- Disable search highlight
opt.ignorecase = true                -- Case-insensitive search...
opt.smartcase = true                 -- ...unless uppercase in search
opt.pumheight = 10                   -- Completion menu height

-- Files/Backups/Undo
opt.undofile = true                  -- Persist undo history
opt.backup = false                   -- Disable backup files
opt.writebackup = false              -- Disable write backup
opt.swapfile = false                 -- Disable swap files
opt.fileencoding = 'utf-8'           -- File encoding

-- Splits/Windows
opt.splitbelow = true                -- Horizontal splits go below
opt.splitright = true                -- Vertical splits go right

-- Performance/Timing
opt.updatetime = 250                 -- Faster completion & CursorHold events
opt.timeoutlen = 300                 -- Key sequence timeout in ms

