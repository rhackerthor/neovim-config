-- 核心设置
require("core.keymaps")
require("core.options")

if vim.g.vscode then
else
  -- 插件配置
  require("config.lazy")
  require("config.lualine")
  require("config.bufferline")
  require("config.nvim-tree")
  require("config.nvim-treesitter")
  require("config.lsp")
  require("config.cmp")
  require("config.theme")
  require("config.markview")
  require("config.notice")
end
