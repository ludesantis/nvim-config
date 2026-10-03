return {
    "jaimecgomezz/here.term",
    opts = {},
    keys = {
      {
        "<leader>t",
        function()
          require("here-term").toggle_terminal()
        end,
        desc = "Toggle terminal"
      },
      {
        "<leader>T",
        function()
          require("here-term").kill_terminal()
        end,
        mode = { "n", "i", "t" },
        desc = "Kill terminal",
      }
    }
}
