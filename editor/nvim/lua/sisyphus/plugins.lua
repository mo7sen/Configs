local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer... Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocmd that reloads neovim whenever the plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a pcall so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'lukas-reineke/indent-blankline.nvim' -- Blanklines per indentation level
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Better syntax highlighting
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  use { 'lewis6991/gitsigns.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = function() require('gitsigns').setup{ current_line_blame = true } end }

  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require("bufferline").setup() end }

  use { 'dracula/vim', as = 'dracula' }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
