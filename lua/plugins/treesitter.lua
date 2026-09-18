return {
  {
    "nvim-treesitter/nvim-treesitter",

    branch = "main",

    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",

        "html",
        "css",
        "scss",

        "json",
        "jsonc",
        
        "java",

        "lua",
        "vim",
        "vimdoc",
        "query",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },
  },
}
