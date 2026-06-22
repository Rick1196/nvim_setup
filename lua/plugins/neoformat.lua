return {
  "sbdchd/neoformat",
  cmd = { "Neoformat" },
  keys = {
    { "<leader>nf", "<cmd>Neoformat<CR>", desc = "Run Neoformat on current buffer", mode = { "n", "v" } },
  },
  config = function()
    -- Format try node exe allows checking local node_modules formatting tools (e.g. prettier)
    vim.g.neoformat_try_node_exe = 1
  end,
}
