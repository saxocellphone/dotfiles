vim.cmd 'packadd paq-nvim'
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "hrsh7th/nvim-compe";
    "scrooloose/nerdtree";
    "kyazdani42/nvim-tree.lua";
    "kyazdani42/nvim-web-devicons";

    -- "knubie/vim-kitty-navigator";
    "nvim-telescope/telescope.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";

    -- Status Line
    "datwaft/bubbly.nvim";
    
    -- Themes
    "sainnhe/sonokai";
    "joshdick/onedark.vim";
}
require('module.telescope')
require('module.compe')
require('module.nvim-tree')
require('module.bubbly')
