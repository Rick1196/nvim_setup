return {
  "lambdalisue/fern.vim",
  cmd = { "Fern" },
  keys = {
    { "<leader>fn", "<cmd>Fern . -drawer -toggle<CR>", desc = "Toggle Fern explorer" },
  },
  config = function()
    -- Set Fern configuration options
    vim.g["fern#drawer_width"] = 30
    vim.g["fern#default_keep_views_on_draw"] = 1
  end,
}
