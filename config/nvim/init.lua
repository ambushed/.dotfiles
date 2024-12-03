vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Map leader to space
vim.g.mapleader = " "
-- vim.lsp.set_log_level("debug")
local fn = vim.fn
local execute = vim.api.nvim_command
-- -- Sensible defaults
require("settings")
require("config.lazy")
-- Install plugins
-- Another option is to groups configuration in one folder


require("colorscheme")
-- ------ Key mappings
require("keymappings")
require("lualine-cfg")
require("mason-cfg")
require("tree-sitter")
require("lsp")
require("dbg")
require("telescope-cfg")
require("terminal")
require("cmake")
require("rust-cfg")
require("lua-lsp")
require("diagnostics-cfg")
require("completion-cfg")
require("formatting")
require("git")
require("bufferline-cfg")
