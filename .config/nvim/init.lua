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
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim",
     "neovim/nvim-lspconfig",
     {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
     {'L3MON4D3/LuaSnip'},
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
    { 'numToStr/Comment.nvim', lazy = false },   
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
    -- ScrachPad
    {
      "LintaoAmons/scratch.nvim", event = "VeryLazy",
    },
    {
      "nvim-treesitter/nvim-treesitter", 
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = "all",
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
          })
      end
    },
}
require("lazy").setup(plugins)
-- require("lsp")
require('lspconfig').lua_ls.setup{}
require("plugins/telescope")

vim.cmd("colorscheme dracula")
require('Comment').setup()
require("nvim-surround").setup()

