return {
	{
   		"oclay1st/gradle.nvim",
   		cmd = { "Gradle", "GradleExec", "GradleInit", "GradleFavorites" },
   		dependencies = {
      			"MunifTanjim/nui.nvim"
   		},
   		opts = {}, -- options, see default configuration
   		keys = {
      			{ '<leader>G', desc = '+Gradle' ,  mode = { 'n', 'v' } },
      			{ '<leader>Gg', '<cmd>Gradle<cr>', desc = 'Gradle Projects' },
			{ '<leader>Ge', '<cmd>GradleExec<cr>', desc = 'Gradle Command Execution' },
      			{ '<leader>Gf', '<cmd>GradleFavorites<cr>', desc = 'Gradle Favorite Commands' }
    		},
	}
}
