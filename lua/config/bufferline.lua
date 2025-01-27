require("bufferline").setup{
  options = {
    themable = true,
    offsets = {
      {
        text = "File Explorer",
        filetype = "NvimTree",
        text_align = "left",
        separator = true
      }
    },
    diagnostics = "nvim_lsp"
  }
}

local keymap = vim.keymap
keymap.set("n", "<C-i>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-o>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<C-x>", ":BufferLineCloseOthers<CR>")
