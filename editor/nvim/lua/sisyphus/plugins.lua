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

vim.api.nvim_set_keymap("n", "<leader>pc", ":PackerCompile<cr>", { noremap = true, silent = true })

local function NOP() end

local function GetConfig(plug)
  local conf_found, config = pcall(require, 'sisyphus.configs.'..plug)
  if conf_found then
    return config
  end
  return NOP
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

function NotStartupBuffer()
  return vim.bo.filetype ~= 'startup' and vim.bo.filetype ~= ''
end

-- Install plugins here
return packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter', -- Better syntax highlighting
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true
        }
      }
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope live_grep<cr>", { noremap = true, silent = true })
    end
  }

  use { 'lewis6991/gitsigns.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = function() require('gitsigns').setup{ current_line_blame = true } end }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = GetConfig('bufferline'),
  }

  use { 'dracula/vim', as = 'dracula' }
  use { 'Mofiqul/vscode.nvim', as = 'vscode' }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = GetConfig('lualine')
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = GetConfig('nvim-tree')
  }

  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = GetConfig('startup'),
  }

  use { -- Blanklines per indentation level
    'lukas-reineke/indent-blankline.nvim',
    after = {'startup.nvim'},
    cond = { NotStartupBuffer }
  }

  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.comment').setup()
      require('mini.pairs').setup()
    end
  }

  use {
    'MunifTanjim/nui.nvim'
  }

  use {
    "ray-x/lsp_signature.nvim"
  }

  use 'tpope/vim-surround'
  use 'tommcdo/vim-lion'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
