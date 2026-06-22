return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
  end,
}
