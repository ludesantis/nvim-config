return {
	{
  		'nvimdev/dashboard-nvim',
  		event = 'VimEnter',
  		config = function()
    			require('dashboard').setup {
            shortcut_type = 'number',
            disable_move = true,
            hide = {
              statusline = true
            },
    				config = {
              week_header = { enable = true },
  					  packages = { enable = true }, -- show how many plugins neovim loaded
				}
			}
  		end,
		opts = {
		},
  		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	}
}
