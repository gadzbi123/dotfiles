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
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Shows what key hints that lead to actions in the popup window below
  "folke/which-key.nvim",
  "folke/lazydev.nvim",
  -- Themes
  "Mofiqul/dracula.nvim",
  "WhiteBlackGoose/andromeda.nvim",
  -- Lsp stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'L3MON4D3/LuaSnip' },
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
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build\
      build --config Release && cmake --install build --prefix build'
  },
  'nvim-telescope/telescope.nvim',
  -- Comments
  'numToStr/Comment.nvim',
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
  -- ScrachPad
  {
    "LintaoAmons/scratch.nvim",
    config = function()
      require("scratch").setup({
        filetypes = { "md", "txt" },
        filetype_details = {
          js = {},
          go = {
            requireDir = true,
            filename = "main",
            content = { "package main", "", "func main() {", "  ", "}" },
            cursor = {
              location = { 4, 2 },
              insert_mode = false,
            },
          },
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
}
require("lazy").setup(plugins)
require("lsp")
require('lspconfig').lua_ls.setup {}
require("plugins/telescope")
require("terminal")

vim.opt.background = "dark"
vim.cmd("colorscheme andromeda")
-- vim.cmd("colorscheme dracula")

require('Comment').setup()
require("nvim-surround").setup()
require("vscode-config")
