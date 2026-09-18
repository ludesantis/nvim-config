return {
	"rebelot/kanagawa.nvim",
	config=function()
		require('kanagawa').setup({
			compile=true,
			theme="wave",
			background={
				dark="wave",
				light="wave"
			}
		});
		vim.cmd("colorscheme kanagawa");
	end,
	build=function()
		vim.cmd("KanagawaCompile");
	end
}
