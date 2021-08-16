vim.cmd 'packadd paq-nvim'
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    -- Git
    "lewis6991/gitsigns.nvim";

    -- File/Grep finder stuff
    "nvim-telescope/telescope.nvim";
    "nvim-telescope/telescope-frecency.nvim";
    "nvim-telescope/telescope-smart-history.nvim";
    "tami5/sql.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    {"ray-x/guihua.lua", run="cd lua/fzy && make"};
    {"junegunn/fzf", run="fzf#install()"};
    "junegunn/fzf.vim";

    -- Appearance
    "joshdick/onedark.vim";
    "romgrk/barbar.nvim";
    "yamatsum/nvim-cursorline";
    "windwp/windline.nvim";

    -- Utils
    "akinsho/nvim-toggleterm.lua";
    "kyazdani42/nvim-tree.lua";
    "kyazdani42/nvim-web-devicons";
    "scrooloose/nerdcommenter";
    "qpkorr/vim-bufkill";
    "rafcamlet/nvim-luapad";
    {"prettier/vim-prettier", run="npm install"};

    -- Testing
    "vim-test/vim-test";
    "google/vim-maktaba";
    "google/vim-coverage";
    {"michaelb/sniprun", run="bass bash install.sh"};  --Code runner

    -- TreeSitter
    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"};
    "nvim-treesitter/playground";

    -- LSP
    "glepnir/lspsaga.nvim";
    "neovim/nvim-lspconfig";
    "hrsh7th/nvim-compe";
    "glepnir/lspsaga.nvim";
    "ray-x/lsp_signature.nvim";
    "mfussenegger/nvim-lint";

    -- Snippets
    "rafamadriz/friendly-snippets";
    "hrsh7th/vim-vsnip";
    "hrsh7th/vim-vsnip-integ";

    -- Debugging
    "puremourning/vimspector";
    "szw/vim-maximizer";


    -- Too slow
    --"ray-x/navigator.lua";

    -- Doesn't work, might write one for lua
    -- "knubie/vim-kitty-navigator";

    -- Maybe One day I'll use 
    --"Xuyuanp/scrollbar.nvim";
    --"symbols-outline.nvim";
    --"mfussenegger/nvim-dap";
    --"rcarriga/nvim-dap-ui";
    --
    -- Coc related
    --{"neoclide/coc.nvim", branch= "release"};
    --"honza/vim-snippets";
    --"sheerun/vim-polyglot";
}
