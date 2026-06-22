-- Silence deprecation warnings from plugins that are still transitioning to newer Neovim APIs
vim.deprecate = function() end

-- Neovim Configuration Entrypoint
require("config.options")
require("config.keymaps")
require("config.lazy")
