require("markview").setup({
  preview = {
    modes = { "n", "no", "c" }, -- Change these modes
    -- to what you need
    hybrid_modes = { "n" },     -- Uses this feature on
    -- normal mode
    -- This is nice to have
    callbacks = {
      on_enable = function (_, win)
        vim.wo[win].conceallevel = 2;
        vim.wo[win].concealcursor = "c";
      end
    }
  }
})

local keymap = vim.keymap
keymap.set("n", "<leader>mo", ":Markview<CR>")
keymap.set("n", "<leader>ms", ":Markview splitToggle<CR>")
