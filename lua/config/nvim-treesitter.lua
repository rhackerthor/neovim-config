require("nvim-treesitter.configs").setup({
  ensure_installed = { 
    "c", 
    "cpp", 
    "lua", 
    "verilog", 
    "scala",
    "python",
    "make" 
  },
  -- 启用代码高亮
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  indent = { enable = true }
})

-- 开启折叠
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
