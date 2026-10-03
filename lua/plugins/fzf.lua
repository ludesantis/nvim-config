return { 
  {
    "ibhagwan/fzf-lua",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    opts = {
      files = {
        hidden = true,
        no_ignore = false,

        fd_opts = table.concat({
          "--color=never",
          "--type=f",
          "--type=l",
          "--exclude=.git",
          "--exclude=**/node_modules/**",
          "--exclude=target",
          "--exclude=dist",
          "--exclude=build",
          "--exclude=.cache",
        }, " "),
      },

      grep = {
        hidden = true,
        no_ignore = false,

        -- Leave the standard fzf-lua rg options alone.
        --
        -- DO NOT put --hidden here.
        -- DO NOT put --ignore-file here.
        rg_opts =
          "--column --line-number --no-heading " ..
          "--color=always --smart-case --max-columns=4096 -e",
      },
    },

    keys = {
      -- ============================================================
      -- Find files in current Oil directory
      -- ============================================================
      {
        "<leader>ff",
        function()
          local oil = require("oil")
          local dir = oil.get_current_dir() or vim.fn.getcwd()

          require("fzf-lua").files({
            cwd = dir,
          })
        end,
        desc = "Find files in project directory",
      },

      -- ============================================================
      -- Find directories in current Oil directory
      -- ============================================================
      {
        "<leader>fd",
        function()
          local oil = require("oil")
          local dir = oil.get_current_dir() or vim.fn.getcwd()

          require("fzf-lua").fzf_exec({
            "fd",
            "--type=d",
            "--hidden",
            "--exclude=.git",
            "--exclude=node_modules",
            "--exclude=target",
            "--exclude=dist",
            "--exclude=build",
            "--exclude=.cache",
          }, {
            cwd = dir,
            prompt = "Find directories> ",

            actions = {
              ["default"] = function(selected)
                if selected[1] then
                  vim.cmd("edit " .. vim.fn.fnameescape(selected[1]))
                end
              end,
            },
          })
        end,
        desc = "Find directories in project directory",
      },

      -- ============================================================
      -- Find files from HOME
      -- ============================================================
      {
        "<leader>f.",
        function()
          require("fzf-lua").files({
            cwd = vim.fn.expand("$HOME"),
          })
        end,
        desc = "Find files from home directory",
      },

      -- ============================================================
      -- Find directories from HOME
      -- ============================================================
      {
        "<leader>f.d",
        function()
          require("fzf-lua").fzf_exec({
            "fd",
            "--type=d",
            "--hidden",
            "--exclude=.git",
            "--exclude=node_modules",
            "--exclude=target",
            "--exclude=dist",
            "--exclude=build",
            "--exclude=.cache",
          }, {
            cwd = vim.fn.expand("$HOME"),
            prompt = "Find directories> ",

            actions = {
              ["default"] = function(selected)
                if selected[1] then
                  vim.cmd("edit " .. vim.fn.fnameescape(selected[1]))
                end
              end,
            },
          })
        end,
        desc = "Find directories in home directory",
      },

      -- ============================================================
      -- Live grep
      -- ============================================================
      {
        "<leader>fg",
        function()
          local oil = require("oil")
          local dir = oil.get_current_dir() or vim.fn.getcwd()

          -- rg exclude globs; passed as --glob=!<pattern> in rg_opts
          -- (fzf-lua has no `glob` option, it would be silently ignored).
          local excludes = {
            "package-lock.json",
            "yarn.lock",
            "pnpm-lock.yaml",
            "bun.lock",
            "bun.lockb",
            "Cargo.lock",
            "composer.lock",

            "**/node_modules/**",
            "target/**",
            "dist/**",
            "build/**",
            ".cache/**",
          }

          local globs = vim.tbl_map(function(pattern)
            return vim.fn.shellescape("--glob=!" .. pattern)
          end, excludes)

          require("fzf-lua").live_grep({
            cwd = dir,

            hidden = true,
            no_ignore = false,

            -- -e must stay last: fzf-lua appends the search query after it.
            rg_opts =
              "--column --line-number --no-heading " ..
              "--color=always --smart-case --max-columns=4096 " ..
              table.concat(globs, " ") .. " -e",
          })
        end,
        desc = "Grep in project directory",
      },
    },
  },
}

