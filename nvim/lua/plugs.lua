vim.cmd 'packadd paq-nvim'
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "hrsh7th/nvim-compe";
    "scrooloose/nerdtree";
    "kyazdani42/nvim-tree.lua";
    "kyazdani42/nvim-web-devicons";
    "scrooloose/nerdcommenter";
    "Xuyuanp/scrollbar.nvim";
    "akinsho/nvim-toggleterm.lua";

    -- Git
    "lewis6991/gitsigns.nvim";

    "nvim-telescope/telescope.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";

    -- Status Line
    "windwp/windline.nvim";
    --"ojroques/nvim-hardline";
    --"datwaft/bubbly.nvim";
    
    -- Themes
    "sainnhe/sonokai";
    "joshdick/onedark.vim";

    -- Doesn't work, might write one for lua
    -- "knubie/vim-kitty-navigator";
}
