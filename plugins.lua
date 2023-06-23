local plugins = {
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
        "pyright",
        "pylint",
        "mypy",
        "jedi-language-server"
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
  ---@type Flash.Config
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
}
}
return plugins
