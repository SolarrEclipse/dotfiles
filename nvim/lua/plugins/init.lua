return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate | TSInstallAll",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "fish",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "java",
        "javadoc",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "luadoc",
        "printf",
        "rust",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      }
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },

  { import = "nvchad.blink.lazyspec" },
}
