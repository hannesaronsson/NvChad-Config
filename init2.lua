local lazypath = vim.fn.stdpath("data") .. "/lazy2/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
        ['+'] = '/mnt/c/Users/harc6k/Executables/win32yank.exe -i --crlf',
        ['*'] = '/mnt/c/Users/harc6k/Executables/win32yank.exe -i --crlf',
    },
    paste = {
        ['+'] = '/mnt/c/Users/harc6k/Executables/win32yank.exe -o --lf',
        ['*'] = '/mnt/c/Users/harc6k/Executables/win32yank.exe -o --lf',
    },
    cache_enabled = 0,
}


local overrides2 = {}


overrides2.treesitter = {
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

local plugins = {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
          {
            "s",
            mode = { "n", "x", "o"},
            function()
              -- default options: exact mode, multi window, all directions, with a backdrop
              require("flash").jump()
            end,
          },
          {
            "S",
            mode = { "n", "x", "o" },
            function()
              require("flash").treesitter()
            end,
          },
        },
      },
      {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
            insert = "<C-g>z",
            insert_line = "<C-g>Z",
            normal = "yz",
            normal_cur = "yzz",
            normal_line = "yZ",
            normal_cur_line = "yZZ",
            visual = "Z",
            visual_line = "gZ",
            delete = "dz",
            change = "cz",
            change_line = "cZ",
        }})
        end,
      },
  {
      "nvim-treesitter/nvim-treesitter",
      opts = overrides2.treesitter,
    }, 
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
       dependencies = {"nvim-treesitter/nvim-treesitter"},
       lazy=false,
       config =function() require('nvim-treesitter.configs').setup(overrides2.treesitter) end
     },
} 

vim.g.mapleader = " "

require("lazy").setup(plugins, {})
