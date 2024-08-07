--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Options --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.scrolloff = 5
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "" -- yank to clipboard "unnamedplus"
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.timeoutlen = 3000
vim.opt.colorcolumn = "81"
vim.opt.spell = true
vim.opt.spelllang = { "pl", "en" }
