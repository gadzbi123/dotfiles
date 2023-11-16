-- Nvim Config --
require("options")
require("keymaps")
-- Plugins --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  "Mofiqul/dracula.nvim",
  "neovim/nvim-lspconfig",
  "simrat39/rust-tools.nvim",
  -- Completion framework:
   'hrsh7th/nvim-cmp',
  -- LSP completion source:
   'hrsh7th/cmp-nvim-lsp',
  -- Useful completion sources:
   'hrsh7th/cmp-nvim-lua',
   'hrsh7th/cmp-nvim-lsp-signature-help',
   'hrsh7th/cmp-vsnip',
   'hrsh7th/cmp-path',                              
   'hrsh7th/cmp-buffer',                            
   'hrsh7th/vim-vsnip',  
   -- Telescope
   'nvim-lua/plenary.nvim',
   'BurntSushi/ripgrep',
   'nvim-telescope/telescope-file-browser.nvim',
   { 'nvim-telescope/telescope-fzf-native.nvim',
   build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    'nvim-telescope/telescope.nvim',
   
}
require("lazy").setup(plugins)
require("lsp")
require("_telescope")

vim.cmd("colorscheme dracula")

-- Rust Tools -- 
local rt = require("rust-tools")

rt.setup({
  tools = {},
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

