return {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "v" } },
    { "gcc", mode = "n" },
  },
  config = function()
    require("Comment").setup()
  end,
}
