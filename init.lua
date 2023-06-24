if vim.fn.has('win32') == 1 then

  vim.api.nvim_set_option("shell", "powershell")
  vim.api.nvim_set_option("shellcmdflag", "-command")
  vim.api.nvim_set_option("shellquote", "\"")
  vim.api.nvim_set_option("shellxquote", "")
end
vim.api.nvim_exec("set rnu", true)
vim.api.nvim_exec('language en_US', true)

-- vim.g.loaded_python3_provider = 1

-- local enable_providers = {
--       "python3_provider",
--     }
--     
--     for _, plugin in pairs(enable_providers) do
--       vim.g["loaded_" .. plugin] = nil
--       vim.cmd("runtime " .. plugin)
--     end

vim.g.maplocalleader = '<Space>'

-- require("plugins.configs.treesitter").setup{
--   textobjects = {
--     select = {
--       enable = true,
-- 
--       -- Automatically jump forward to textobj, similar to targets.vim
--       lookahead = true,
-- 
--       keymaps = {
--         -- You can use the capture groups defined in textobjects.scm
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         -- You can optionally set descriptions to the mappings (used in the desc parameter of
--         -- nvim_buf_set_keymap) which plugins like which-key display
--         ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--         -- You can also use captures from other query groups like `locals.scm`
--       },}}}

