vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = { sorter = "case_sensitive" },
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = true }
})

local keymap = vim.keymap
keymap.set("n", "<leader>to", ":NvimTreeOpen<CR>")
keymap.set("n", "<leader>tc", ":NvimTreeClose<CR>")
