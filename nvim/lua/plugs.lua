vim.cmd 'packadd packer.nvim'
return require("packer").startup(function()
    local function conf(name)
      return ([[require('plugconfigs.config').%s()]]):format(name)
    end
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- File/Grep finder stuff
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-frecency.nvim"
    use "nvim-telescope/telescope-smart-history.nvim"
    use "tami5/sqlite.lua"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use {"ray-x/guihua.lua", run="cd lua/fzy && make"}
    use {"junegunn/fzf", run="fzf#install()"}
    use "junegunn/fzf.vim"
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
		use {"chentau/marks.nvim"}

    -- Appearance
    use "joshdick/onedark.vim"
    use "romgrk/barbar.nvim"
    use "yamatsum/nvim-cursorline"
    use "windwp/windline.nvim"

    -- Utils
    use "akinsho/nvim-toggleterm.lua"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "scrooloose/nerdcommenter"
    use "qpkorr/vim-bufkill"
    use "rafcamlet/nvim-luapad"
    use {"prettier/vim-prettier", run="npm install"}
    use {
				-- For search location
				'kevinhwang91/nvim-hlslens',
				keys = {'n', 'N', '/', '?', '*', '#', 'g*', 'g#'},
				config = conf('hlslens'),
				requires = {{'haya14busa/vim-asterisk'}}
    }
		use {'kevinhwang91/rnvimr', config = conf('rnvimr'), opt = false} -- Ranger explorer
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
		use {'kkoomen/vim-doge', run="call doge#install()"}


    -- Testing
    use "vim-test/vim-test"
    use "google/vim-maktaba"
    use "google/vim-coverage"
    --use {"michaelb/sniprun", run="bass bash install.sh"}

    -- TreeSitter
		use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate", branch="0.5-compat"}
		use "nvim-treesitter/playground"

    -- LSP
		use {"neovim/nvim-lspconfig", run="npm i -g diagnostic-languageserver"}
		--use "glepnir/lspsaga.nvim" Not maintained :(
		use {"tami5/lspsaga.nvim", branch = 'nvim51'}
		use "ray-x/lsp_signature.nvim"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/nvim-cmp"
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'

    -- Snippets
		use "rafamadriz/friendly-snippets"
		use "hrsh7th/vim-vsnip"
		use 'hrsh7th/cmp-vsnip'
		use "hrsh7th/vim-vsnip-integ"

    -- Navigator for tmux
    use "christoomey/vim-tmux-navigator"

    -- Debugging
    --"puremourning/vimspector";
    --"szw/vim-maximizer";

    -- Maybe One day I'll use 
    --"Xuyuanp/scrollbar.nvim";
    --"symbols-outline.nvim";
    --"mfussenegger/nvim-dap";
    --"rcarriga/nvim-dap-ui";
    if packer_bootstrap then
        require('packer').sync()
    end
end)
