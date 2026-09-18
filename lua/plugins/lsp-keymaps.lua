return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      -- Show diagnostics for the current line
      vim.keymap.set("n", "<leader>§", vim.diagnostic.open_float, {
        desc = "Show diagnostics",
      })

      -- Go to next diagnostic
      vim.keymap.set("n", "<leader>§j", vim.diagnostic.goto_next, {
        desc = "Next diagnostic",
      })

      -- Go to previous diagnostic
      vim.keymap.set("n", "<leader>§h", vim.diagnostic.goto_prev, {
        desc = "Previous diagnostic",
      })
    end,
  },
}
