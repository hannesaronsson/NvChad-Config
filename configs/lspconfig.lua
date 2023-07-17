local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")


lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = (function()
  local capabilities = require("plugins.configs.lspconfig").capabilities
  capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
  return capabilities
  end)(),
  root_dir = require("lspconfig").util.root_pattern(".git","pyrightconfig.json"),
  filetypes = {"python"},
  settings ={python = {
    analysis = {
    stubPath = vim.fn.has('win32') == 1 and vim.fn.stdpath("data") .. "\\lazy\\python-type-stubs\\stubs" or vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
    }}
  },
})


lspconfig.ruff_lsp.setup({
  on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  end,
  root_dir = require("lspconfig").util.root_pattern(".git","pyrightconfig.json"),
  capabilities = capabilities
})

lspconfig.rnix.setup({
  on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = {"nix"},
})


lspconfig.css_lsp.setup({
  on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
-- lspconfig.jedi_language_server.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"python"},
-- })

-- lspconfig.ruff_lsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities 
-- })

-- lspconfig.pylsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"python"},
-- })

