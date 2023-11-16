-- Better Keymaps
local M = {}
-- :help map-modes
function M.map(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end
function M.noremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
function M.exprnoremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true })
end

-- stylua: ignore start
function M.nmap(lhs, rhs) M.map('n', lhs, rhs) end
function M.nnoremap(lhs, rhs) M.noremap('n', lhs, rhs) end
function M.vnoremap(lhs, rhs) M.noremap('v', lhs, rhs) end
function M.xnoremap(lhs, rhs) M.noremap('x', lhs, rhs) end
function M.inoremap(lhs, rhs) M.noremap('i', lhs, rhs) end
function M.tnoremap(lhs, rhs) M.noremap('t', lhs, rhs) end
function M.exprinoremap(lhs, rhs) M.exprnoremap('i', lhs, rhs) end
function M.exprnnoremap(lhs, rhs) M.exprnoremap('n', lhs, rhs) end

-- Keymapping --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

M.nnoremap("<leader>y", '"+y')
M.vnoremap("<leader>y", '"+y')
M.vnoremap('J', ":m '>+1<CR>gv=gv")
M.vnoremap('K', ":m '<-2<CR>gv=gv")
-- Save the pasted text (if replacing with visual mode)
M.vnoremap('p',"pgvy")
M.vnoremap('(',"xi()<Esc>P")
M.vnoremap(')',"xi()<Esc>P")
M.vnoremap('{',"xi{}<Esc>P")
M.vnoremap('}',"xi{}<Esc>P")
M.vnoremap('[',"xi[]<Esc>P")
M.vnoremap(']',"xi[]<Esc>P")

-- Config modification
if string.find(vim.loop.os_uname().sysname, "Linux") then
  M.nnoremap("<leader>ocf",":e ~/.config/nvim/init.lua <CR>")
  M.nnoremap("<leader>soc",":source ~/.config/nvim/init.lua <CR>")
else
   M.nnoremap("<leader>ocf",":e C:/Users/Gadzbi/AppData/Local/nvim/init.lua <CR>")
   M.nnoremap("<leader>soc",":source C:/Users/Gadzbi/AppData/Local/nvim/init.lua <CR>")
end

-- Spliting
M.nnoremap("<leader>v",":vs<CR>")
M.nnoremap("<leader>s",":split<CR>")
M.nnoremap("<C-h>","<C-w>h")
M.nnoremap("<C-j>","<C-w>j")
M.nnoremap("<C-k>","<C-w>k")
M.nnoremap("<C-l>","<C-w>l")

-- Resizing
M.nnoremap("<C-Left>",":vertical resize +3<CR>")
M.nnoremap("<C-Right>",":vertical resize -3<CR>")

-- Move commands
M.nnoremap("<C-d>","<C-d>zz")
M.nnoremap("<C-u>","<C-u>zz")
M.nnoremap("<C-f>","<C-f>zz")
M.nnoremap("<C-b>","<C-b>zz")
