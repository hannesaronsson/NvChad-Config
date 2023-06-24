local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "json",
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = { "@function.outer", "Select outer part of a function region" },
        ["if"] = { "@function.inner", "Select inner part of a function region" },
        ["ac"] = { "@class.outer", "Select outer part of a class region" }, 
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },

      }
    }
  }
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M 
