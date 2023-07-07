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
    "regex",
    "bash",
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

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = { query = "@function.outer", desc= "Select outer part of a function region" },
        ["if"] = { query =  "@function.inner", desc= "Select inner part of a function region" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" }, 
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },

        -- You can also use captures from other query groups like `locals.scm`
      }
    }
  }
}

M.nvimtree = {
  git = {
    enable = false,
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
