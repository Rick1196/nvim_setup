return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Use defaults: ys (add surround), ds (delete surround), cs (change surround)
    })
  end,
}
