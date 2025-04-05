-- mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- mason-lspconfig
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua-ls", -- lua
    "clangd", -- c/c++
    "clang-format", -- json
  }
})

-- lspconfig
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").lua_ls.setup({
  -- capabilities = capabilities
})
require("lspconfig").clangd.setup({
  -- capabilities = capabilities
})
require("lspconfig").metals.setup({
})
