local M = {}

M.general = {
  n = {
    [","] = { ":", "enter command mode", opts = { nowait = true } }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }}

M.chatgpt = {
  plugin = true,
  n = {
    ["<leader>cge"] = {"<cmd>ChatGPTRun explain_code<CR>", "Explain Code"}, -- Explain code
    ["<leader>cgd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" }, -- Docstring
    ["<leader>cgf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" }, -- Fix bugs
    ["<leader>cgo"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" }, -- Optimize code
    ["<leader>cgt"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add tests" }, -- Optimize code
    ["<leader>cgc"] = { "<cmd>ChatGPTCompleteCode<CR>", "Complete Code" }, -- Complete code
    ["<leader>cgi"] = {"<cmd>ChatGPTEditWithInstructions<CR>", "Edit with instructions"} -- Edit with instructions
    
  },
  v = {
    ["<leader>cge"] = {"<cmd>ChatGPTRun explain_code<CR>", "Explain Code"}, -- Explain code
    ["<leader>cgd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" }, -- Docstring
    ["<leader>cgf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" }, -- Fix bugs
    ["<leader>cgo"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" }, -- Optimize code
    ["<leader>cgt"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add tests" }, -- Optimize code
    ["<leader>cgc"] = { "<cmd>ChatGPTCompleteCode<CR>", "Complete Code" }, -- Complete code
    ["<leader>cgi"] = {"<cmd>ChatGPTEditWithInstructions<CR>", "Edit with instructions"} -- Edit with instructions
  },
  x = {
    ["<leader>cge"] = {"<cmd>ChatGPTRun explain_code<CR>", "Explain Code"}, -- Explain code
    ["<leader>cgd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" }, -- Docstring
    ["<leader>cgf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" }, -- Fix bugs
    ["<leader>cgo"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" }, -- Optimize code
    ["<leader>cgt"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add tests" }, -- Optimize code
    ["<leader>cgc"] = { "<cmd>ChatGPTCompleteCode<CR>", "Complete Code" }, -- Complete code
    ["<leader>cgi"] = {"<cmd>ChatGPTEditWithInstructions<CR>", "Edit with instructions"} -- Edit with instructions
},
  }

M.conjure = {
 n = { 
    ["<leader>re"] = {"<cmd>ConjureEval<CR>", "Eval Code"}, -- Explain code
  }
}

M.project_telescope = {
  n = {
    ["<leader>tp"] = {
      function()
      require'telescope'.extensions.project.project()
      end
    }
  }
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>7"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>7"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
