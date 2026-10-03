return {
	{
		"oclay1st/gradle.nvim",
		cmd = { "Gradle", "GradleExec", "GradleInit", "GradleFavorites" },
		dependencies = {
			"MunifTanjim/nui.nvim",
		},

		opts = {},

		keys = {
			{ "<leader>G", desc = "+Gradle", mode = { "n", "v" } },

			{
				"<leader>Gg",
				function()
					local oil = require("oil")
					local dir = oil.get_current_dir()

					if dir then
						vim.cmd("lcd " .. vim.fn.fnameescape(dir))
					end

					vim.cmd("Gradle")
				end,
				desc = "Gradle Projects",
			},

			{
				"<leader>Ge",
				function()
					local oil = require("oil")
					local dir = oil.get_current_dir()

					if dir then
						vim.cmd("lcd " .. vim.fn.fnameescape(dir))
					end

					vim.cmd("GradleExec")
				end,
				desc = "Gradle Command Execution",
			},

			{
				"<leader>Gf",
				"<cmd>GradleFavorites<cr>",
				desc = "Gradle Favorite Commands",
			},
		},
	},
}

