vim.api.nvim_set_option("shell", "powershell")
vim.api.nvim_set_option("shellcmdflag", "-command")
vim.api.nvim_set_option("shellquote", "\"")
vim.api.nvim_set_option("shellxquote", "")
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
