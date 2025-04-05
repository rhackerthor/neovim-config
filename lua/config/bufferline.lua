require("bufferline").setup{
  options = {
    separator_style = "slant",
    themable = true,
    -- 让出 nvim-tree 的位置
    offsets = {
      {
        text = "File Explorer",
        filetype = "NvimTree",
        text_align = "left",
        separator = true
      }
    },
    diagnostics = "nvim_lsp",
    color_icons = true,
  }
}

local keymap = vim.keymap
keymap.set("n", "<C-i>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-o>", ":BufferLineCycleNext<CR>")

