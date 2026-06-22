return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff split" },
    { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
    { "<leader>gl", "<cmd>Git log<CR>", desc = "Git log" },
  },
}
