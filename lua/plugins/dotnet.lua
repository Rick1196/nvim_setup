return {
  {
    "tris203/rzls.nvim",
    config = function()
      require("rzls").setup({})
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = { "tris203/rzls.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Custom LSP Keybinds (consistent with lsp.lua)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", vim.tbl_extend("force", opts, { desc = "Show references" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation (Hover)" }))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic float" }))
      end

      require("roslyn").setup({
        args = {
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          "--stdio",
        },
        config = {
          capabilities = capabilities,
          on_attach = on_attach,
          handlers = require("rzls.roslyn_handlers"),
          settings = {
            ["csharp|background_analysis"] = {
              dotnet_compiler_diagnostics_scope = "fullSolution",
            },
          },
        },
      })
    end,
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("easy-dotnet").setup()

      -- Filetype mappings for Razor/Blazor
      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })

      -- Keymaps for easy-dotnet
      vim.keymap.set("n", "<leader>dr", "<cmd>Dotnet run<cr>", { desc = "Dotnet Run" })
      vim.keymap.set("n", "<leader>dt", "<cmd>Dotnet test<cr>", { desc = "Dotnet Test" })
      vim.keymap.set("n", "<leader>dx", "<cmd>Dotnet testrunner<cr>", { desc = "Dotnet Test Runner" })
    end,
  },
}
