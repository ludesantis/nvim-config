return {
	{
  		"ibhagwan/fzf-lua",
  		-- optional for icon support
  		dependencies = { "nvim-tree/nvim-web-devicons" },
  		-- or if using mini.icons/mini.nvim
  		-- dependencies = { "nvim-mini/mini.icons" },
  		---@module "fzf-lua"
  		---@type fzf-lua.Config|{}
  		---@diagnostic disable: missing-fields
  		opts = {},
  		---@diagnostic enable: missing-fields
		keys = {
			{ 
				"<leader>ff", 
				function() 
					local oil = require("oil")
  					local dir = oil.get_current_dir()

					require('fzf-lua').files({
						cwd = dir
					}) 
				end,
				desc="Find files in project directory."
			},
      {
        "<leader>fd",
        function()
          local oil = require("oil")
          local dir = oil.get_current_dir() or vim.fn.getcwd()

          require('fzf-lua').fzf_exec(
            'find ' .. dir .. ' -type d',
            {
              hidden = true,
              actions = {
                ["default"] = function(selected)
                  vim.cmd("edit " .. vim.fn.fnameescape(selected[1]))
                end,
              }
            }
          )
        end,
        desc="Find directories in project directory."
      },
      {
        "<leader>f.",
        function()
          require('fzf-lua').files({
            cwd = '/Users/lukassinger',
            hidden = true
          })
        end,
        desc="Find files from root directory."
      },
      {
        "<leader>f.d",
        function()
          require('fzf-lua').fzf_exec(
            'find /Users/lukassinger -type d',
            {
              prompt = "Find directories> ",
              hidden = true,
              actions = {
                ["default"] = function(selected)
                    vim.cmd("edit " .. vim.fn.fnameescape(selected[1]))
                end,
              }
            }
        )
        end,
        desc="Find directories in root directory."
      },
			{
				"<leader>fg",
				function() 
					local oil = require("oil")
					local dir = oil.get_current_dir()

					require('fzf-lua').live_grep({
						cwd = dir
					}) 
				end,
				desc="Find by grepping in project directory."
			}
		}
	}
}
