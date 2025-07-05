-- Better Keymaps
local M = {}
-- :help map-modes
function M.map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, unpack(opts or {}) })
end

function M.noremap(mode, lhs, rhs, opts)
  local o = opts or {}
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, unpack(o) })
end

function M.exprnoremap(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true, unpack(opts or {}) })
end

-- stylua: ignore start
function M.nmap(lhs, rhs, opts) M.map('n', lhs, rhs, opts) end

function M.nnoremap(lhs, rhs, opts) M.noremap('n', lhs, rhs, opts) end

function M.vnoremap(lhs, rhs, opts) M.noremap('v', lhs, rhs, opts) end

function M.xnoremap(lhs, rhs, opts) M.noremap('x', lhs, rhs, opts) end

function M.inoremap(lhs, rhs, opts) M.noremap('i', lhs, rhs, opts) end

function M.tnoremap(lhs, rhs, opts) M.noremap('t', lhs, rhs, opts) end

function M.exprinoremap(lhs, rhs, opts) M.exprnoremap('i', lhs, rhs, opts) end

function M.exprnnoremap(lhs, rhs, opts) M.exprnoremap('n', lhs, rhs, opts) end

-- Keymapping --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

M.nnoremap("<leader>y", '"+y', { desc = "yank to clipboard" })
M.vnoremap("<leader>y", '"+y', { desc = "yank to clipboard" })
M.vnoremap('J', ":m '>+1<CR>gv=gv")
M.vnoremap('K', ":m '<-2<CR>gv=gv")
-- Save the pasted text (if replacing with visual mode)
M.vnoremap('p', "pgvy")

-- Config modification
if string.find(vim.loop.os_uname().sysname, "Linux") then
  M.nnoremap("<leader>ocf", ":e ~/.config/nvim/init.lua <CR>")
  M.nnoremap("<leader>soc", ":source ~/.config/nvim/init.lua <CR>")
else
  M.nnoremap("<leader>ocf", ":e C:/Users/Gadzbi/AppData/Local/nvim/init.lua <CR>")
  M.nnoremap("<leader>soc", ":source C:/Users/Gadzbi/AppData/Local/nvim/init.lua <CR>")
end

-- Spliting
M.nnoremap("<leader>v", ":vs<CR>", { desc = "split vertical" })
M.nnoremap("<leader>ss", ":split<CR>", { desc = "split horizontal" })
M.nnoremap("<C-h>", "<C-w>h")
M.nnoremap("<C-j>", "<C-w>j")
M.nnoremap("<C-k>", "<C-w>k")
M.nnoremap("<C-l>", "<C-w>l")

-- Resizing
M.nnoremap("<C-Left>", ":vertical resize +3<CR>")
M.nnoremap("<C-Right>", ":vertical resize -3<CR>")

-- Move commands
M.nnoremap("<C-d>", "<C-d>zz")
M.nnoremap("<C-u>", "<C-u>zz")
M.nnoremap("<C-f>", "<C-f>zz")
M.nnoremap("<C-b>", "<C-b><S-m>")

-- ScratchPad
M.nnoremap("<M-C-n>", "<cmd>Scratch<cr>")
M.nnoremap("<M-C-o>", "<cmd>ScratchOpen<cr>")
