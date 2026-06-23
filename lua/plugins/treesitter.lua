return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true

    local ts = require("nvim-treesitter")
    ts.setup()

    local parsers = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "rust",
      "json",
      "yaml",
      "dockerfile",
      "markdown",
      "markdown_inline",
      "html",
      "css",
      "bash",
    }

    -- Install missing parsers only
    local installed = ts.get_installed()
    local to_install = {}
    for _, p in ipairs(parsers) do
      if not vim.list_contains(installed, p) then
        table.insert(to_install, p)
      end
    end

    if #to_install > 0 then
      ts.install(to_install)
    end

    -- Enable highlight for standard languages
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
