return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-tree/nvim-web-devicons",

      -- Diff viewer (side-by-side diffs, file history, conflict resolution)
      {
        "sindrets/diffview.nvim",
        cmd = {
          "DiffviewOpen",
          "DiffviewClose",
          "DiffviewToggleFiles",
          "DiffviewFocusFiles",
          "DiffviewRefresh",
          "DiffviewFileHistory",
        },
        opts = {
          enhanced_diff_hl = true,
          view = {
            merge_tool = {
              layout = "diff3_mixed",
              disable_diagnostics = true,
            },
          },
        },
      },

      -- Colorizes ANSI output of log_pager (only used when delta is installed)
      "m00qek/baleia.nvim",

      -- Picker used for branch/commit/file selection
      "ibhagwan/fzf-lua",
    },
    cmd = { "Neogit", "NeogitLogCurrent", "NeogitCommit", "NeogitResetState" },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit status" },
      {
        "<leader>gG",
        function()
          require("neogit").open({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Neogit status (repo of current file)",
      },
      { "<leader>gC", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Neogit push" },
      { "<leader>gU", "<cmd>Neogit pull<cr>", desc = "Neogit pull" },
      { "<leader>gf", "<cmd>Neogit fetch<cr>", desc = "Neogit fetch" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Neogit branch" },
      { "<leader>gr", "<cmd>Neogit rebase<cr>", desc = "Neogit rebase" },
      { "<leader>gm", "<cmd>Neogit merge<cr>", desc = "Neogit merge" },
      { "<leader>gS", "<cmd>Neogit stash<cr>", desc = "Neogit stash" },
      { "<leader>gw", "<cmd>Neogit worktree<cr>", desc = "Neogit worktree" },
      { "<leader>gL", "<cmd>Neogit log<cr>", desc = "Neogit log" },
      { "<leader>gh", "<cmd>NeogitLogCurrent<cr>", desc = "Git history (current file)" },
      { "<leader>gh", ":NeogitLogCurrent<cr>", mode = "x", desc = "Git history (selected lines)" },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
    },

    ---@module "neogit"
    ---@type NeogitConfig
    opts = {
      graph_style = "unicode",
      process_spinner = true,
      treesitter_diff_highlight = true,
      word_diff_highlight = true,

      -- Safety prompts
      prompt_force_push = true,
      prompt_amend_commit = true,

      -- Remember toggled flags (e.g. --force-with-lease) per project
      remember_settings = true,
      use_per_project_settings = true,

      fetch_after_checkout = true,
      sort_branches = "-committerdate",
      commit_order = "topo",
      disable_insert_on_commit = "auto",

      -- Pretty diffs in log/commit views if delta is available
      log_pager = vim.fn.executable("delta") == 1
          and { "delta", "--width", "117", "--hyperlinks=false" }
        or nil,

      filewatcher = {
        enabled = true,
        interval = 1000,
      },

      -- Only show the console when a slow command fails
      console_timeout = 2000,
      auto_show_console = true,
      auto_show_console_on = "error",
      auto_close_console = true,

      kind = "tab",
      commit_editor = {
        kind = "tab",
        show_staged_diff = true,
        staged_diff_split_kind = "vsplit",
        spell_check = true,
      },
      commit_view = {
        kind = "vsplit",
        verify_commit = vim.fn.executable("gpg") == 1,
      },
      log_view = { kind = "tab" },
      reflog_view = { kind = "tab" },
      rebase_editor = { kind = "auto" },
      merge_editor = { kind = "auto" },
      popup = { kind = "split", show_title = true },

      status = {
        show_head_commit_hash = true,
        recent_commit_count = 15,
      },

      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },

      sections = {
        untracked = { folded = false },
        unstaged = { folded = false },
        staged = { folded = false },
        stashes = { folded = true },
        unpulled_upstream = { folded = true },
        unmerged_upstream = { folded = false },
        unpulled_pushRemote = { folded = true },
        unmerged_pushRemote = { folded = false },
        recent = { folded = true },
        rebase = { folded = true },
      },

      diff_viewer = "diffview",
      integrations = {
        diffview = true,
        fzf_lua = true,
        telescope = false,
        mini_pick = false,
        snacks = false,
        codediff = false,
      },
    },

    config = function(_, opts)
      require("neogit").setup(opts)

      -- Reload buffers changed on disk by git operations (checkout, pull, rebase, ...)
      local group = vim.api.nvim_create_augroup("NeogitUserEvents", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = {
          "NeogitPullComplete",
          "NeogitBranchCheckout",
          "NeogitBranchReset",
          "NeogitRebase",
          "NeogitReset",
          "NeogitMerge",
          "NeogitStash",
          "NeogitCherryPick",
        },
        callback = function()
          vim.cmd("checktime")
        end,
      })
    end,
  },
}
