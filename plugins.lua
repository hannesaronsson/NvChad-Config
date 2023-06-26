local overrides = require("custom.configs.overrides")
local plugins = {

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
{
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
{
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end      local dapui = require("dapui")
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "ruff-lsp",
        "ruff",
        "pyright",
        "pylint",
        "mypy",
        "jedi-language-server",
        "lua-language-server"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
{
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
    },
    {
      "S",
      mode = { "n", "o", "x" },
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
            -- Configuration here, or leave empty to use defaults
        })
    end
},
{
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(
      {edit_with_instructions = {keymaps = {use_output_as_input = "<C-b>"}}})
      require("core.utils").load_mappings("chatgpt")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
},
  {
    "Olical/conjure",
    cmd = {
        "ConjureEval",
        "ConjureSchool",
        "ConjureConnect",
        "ConjureClientState",
        --
        "ConjureLogSplit",
        "ConjureLogVSplit",
        "ConjureLogTab",
        "ConjureLogBuf",
        "ConjureLogToggle",
        "ConjureLogResetSoft",
        "ConjureLogResetHard",
        "ConjureLogJumpToLatest",
        "ConjureLogCloseVisible",
        --
        "ConjureEvalCurrentForm",
        "ConjureEvalCommentCurrentForm",
        "ConjureEvalRootForm",
        "ConjureEvalCommentRootForm",
        "ConjureEvalWord",
        "ConjureEvalCommentWord",
        "ConjureEvalReplaceForm",
        "ConjureEvalMarkedForm",
        "ConjureEvalCommentForm",
        "ConjureEvalFile",
        "ConjureEvalBuf",
        "ConjureEvalMotion",
        "ConjureEvalVisual",
    },
    -- [Optional] cmp-conjure for cmp
    dependencies = {
        {
            "PaterJason/cmp-conjure",
            config = function()
                local cmp = require("cmp")
                local config = cmp.get_config()
                table.insert(config.sources, {
                    name = "buffer",
                    option = {
                        sources = {
                            { name = "conjure" },
                        },
                    },
                })
                cmp.setup(config)
            end,
        },
    },
    config = function(_, opts)
        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()
        require("core.utils").load_mappings("conjure")
    end,
    init = function()
	-- Set configuration options here
        vim.g["conjure#mapping#prefix"] = "<leader>r"
        vim.g["conjure#client#python#stdio#command"] = 'python -iq'
    end,
},
{
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy=false,
 opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
},
  {
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },

    -- you can specify also another config if you want
    config = function()
      local browser_cmd = "open"
      if vim.fn.has('win32') == 1 then
          browser_cmd = "powershell.exe start firefox.exe"
      end 
      require("gx").setup {
      open_browser_app = browser_cmd, -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
      },
      handler_options = {
        search_engine = "google", -- you can select between google, bing and duckduckgo
      },
    } end,
  },
},
{
   "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {"nvim-treesitter/nvim-treesitter"
    },
  lazy=false
},
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
  },
{
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
    cmd = {
      "ZenMode"
    }
},
{
  "folke/twilight.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
    cmd = {"Twilight",
      "TwilightEnable",
      "TwilightDisable"
    }
},
-- {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   opts = {
--     -- add any options here
--   },
--   dependencies = {
--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--     "rcarriga/nvim-notify",
--     },
--   config = function() 
--     require("noice").setup({
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true, -- use a classic bottom cmdline for search
--     command_palette = true, -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = false, -- add a border to hover docs and signature help
--   },
-- })
    -- end
-- },
  { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim', 
    config = function() 
      require("neogit").setup({}) 
    end,
    cmd = {
      "Neogit",
      "Neogit commit"
    } 
  }
}
return plugins
