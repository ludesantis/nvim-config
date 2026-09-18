return {
  {
    "saghen/blink.cmp",
    version = "1.*",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      keymap = {
        preset = "enter",

        ["<C-Space>"] = {
          "show",
          "show_documentation",
          "hide_documentation",
        },

        ["<CR>"] = {
          "accept",
          "fallback",
        },

        ["<Tab>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },

        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },

        ghost_text = {
          enabled = true,
        },

        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
}
