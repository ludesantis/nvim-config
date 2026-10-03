return {
	{
    		"TheLazyCat00/runner-nvim",
    		opts = {}, -- This is required to call setup()
    		keys = {
        		{ 
              "<leader>r", 
              function () 
                require("runner-nvim").runLast() 
              end, 
              desc = "Run last cmd" 
            },
        		{ 
              "<leader>o", 
              function () 
                require("runner-nvim").run() 
              end, 
              desc = "Run cmd" 
            },
        		{ 
              "<leader>t", 
              function ()
                local oil = require("oil")
                local dir = oil.get_current_dir() or vim.fn.getcwd()

                vim.fn.chdir(dir, "global")

                require("runner-nvim").toggle({
                  cwd = dir
                }) 
              end, 
              desc = "Toggle terminal"
            },
    		}
	}
}
