local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('plugs')
require('settings')
require('maps')

require('module.telescope')
require('module.nvim-tree')
require('module.gitsigns')
require('module.toggleterm')
require('module.windline')
require('module.sniprun')
require('module.compe')
require('module.lspconfig')
require('module.lspsaga')
require('module.treesitter')
require('module.lsp-signature')
require('module.tmux_vim_navigator')
