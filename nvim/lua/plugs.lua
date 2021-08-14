vim.cmd 'packadd paq-nvim'
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    -- Coc related
    {"neoclide/coc.nvim", branch= "release"};
    "honza/vim-snippets";
    "sheerun/vim-polyglot";

    -- Git
    "lewis6991/gitsigns.nvim";

    -- File/Grep finder stuff
    "nvim-telescope/telescope.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    {"ray-x/guihua.lua", run="cd lua/fzy && make"};
    {"junegunn/fzf", run="fzf#install()"};
    "junegunn/fzf.vim";

    -- Status Line

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
    "SirVer/ultisnips";
    "rafcamlet/nvim-luapad";

    -- Testing
    "vim-test/vim-test";
    "google/vim-maktaba";
    "google/vim-coverage";
    {"michaelb/sniprun", run="bass bash install.sh"};  --Code runner

    -- Others

    -- Debugging
    --"mfussenegger/nvim-dap";
    --"rcarriga/nvim-dap-ui";


    -- Doesn't work, might write one for lua
    -- "knubie/vim-kitty-navigator";

    -- Maybe One day I'll use 
    --"nvim-telescope/telescope-frecency.nvim";
    --"ray-x/navigator.lua";
    --{"nvim-treesitter/nvim-treesitter", run=":TSUpdate"};
    --"tami5/sql.nvim";
    --"neovim/nvim-lspconfig";          -- Mind the semi-colons
    --"hrsh7th/nvim-compe";
    --"Xuyuanp/scrollbar.nvim";
}
