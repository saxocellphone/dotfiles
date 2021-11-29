local M = {}
local cmd = vim.cmd

local g = vim.g

package.path = package.path .. ";../?.lua"
local utils = require('utils')
function M.hlslens()
		require('hlslens').setup({
				auto_enable = true,
				enable_incsearch = true,
				calm_down = true,
				nearest_only = true,
				nearest_float_when = 'auto',
				float_shadow_blend = 50,
				virt_priority = 100
		})

		cmd([[com! HlSearchLensToggle lua require('hlslens').toggle()]])

		utils.map('n', 'n', [[<Cmd>execute('norm! ' . v:count1 . 'nzv')<CR><Cmd>lua require('hlslens').start()<CR>]])
		utils.map('n', 'N', [[<Cmd>execute('norm! ' . v:count1 . 'Nzv')<CR><Cmd>lua require('hlslens').start()<CR>]])
		utils.map('', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
		utils.map('', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
		utils.map('', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
		utils.map('', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})
end

function M.rnvimr()
	utils.map('n', '<leader>ls', ":RnvimrToggle<CR>")
end

return M
