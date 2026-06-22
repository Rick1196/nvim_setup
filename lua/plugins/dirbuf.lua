return {
  "elihunter173/dirbuf.nvim",
  cmd = { "Dirbuf" },
  keys = {
    { "<leader>db", "<cmd>Dirbuf<CR>", desc = "Open Dirbuf file manager" },
  },
  config = function()
    require("dirbuf").setup({
      show_hidden = true,
    })
  end,
}
