local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Disable auto comment continuation globally
augroup("mygroup", { clear = true })  -- Create/clear group
autocmd("FileType", {
    pattern = "*",
    group = "mygroup",
    desc = "Disable auto comment continuation",
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })  -- Remove auto-wrap and Enter/o/O continuation
    end,
})

-- Highlight text on yank
autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function() vim.hl.on_yank() end,
})

