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

    -- Testing
    use "vim-test/vim-test"
    use "google/vim-maktaba"
    use "google/vim-coverage"
    use {"michaelb/sniprun", run="bass bash install.sh"}

    -- TreeSitter
		use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate", branch="0.5-compat"}
    use "nvim-treesitter/playground"

    -- LSP
    use "glepnir/lspsaga.nvim"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "glepnir/lspsaga.nvim"
    use "ray-x/lsp_signature.nvim"

    -- Snippets
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"

    -- Navigator for tmux
		use "christoomey/vim-tmux-navigator"

    -- Debugging
    --"puremourning/vimspector";
    --"szw/vim-maximizer";

    -- Too slow
    --"ray-x/navigator.lua";

    
    -- Don't need it since diagnosticls handles it
    --"mfussenegger/nvim-lint";

    -- Maybe One day I'll use 
    --"Xuyuanp/scrollbar.nvim";
    --"symbols-outline.nvim";
    --"mfussenegger/nvim-dap";
    --"rcarriga/nvim-dap-ui";

    -- Coc related, incase I want to go back
    --{"neoclide/coc.nvim", branch= "release"};
    --"honza/vim-snippets";
    --"sheerun/vim-polyglot";
		if packer_bootstrap then
			require('packer').sync()
		end
end)
