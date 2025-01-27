local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  -- 指定snippet引擎
  snippet = {
    expand = function(args)
      -- 使用vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- 来源
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "vsnip" },
    },
    {
      { name = "buffer" },
      { name = "path" }
    }
  ),
  -- 使用lspkind-nvim显示类型图标
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end
    })
  },
  -- 快捷键绑定
  mapping = {
    -- prev
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- next
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 取消
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
})
