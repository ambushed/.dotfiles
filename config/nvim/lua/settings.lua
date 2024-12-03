local utils = require("utils")
local os = require("os")
local cmd = vim.cmd
local fn = vim.fn
local indent = 2

cmd("syntax enable")
cmd("filetype plugin indent on")

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

utils.opt("b", "expandtab", true)
utils.opt("b", "shiftwidth", indent)
utils.opt("b", "smartindent", true)
utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", indent)
utils.opt("b", "swapfile", false)
utils.opt("b", "autoindent", true)
utils.opt("o", "hidden", true)
utils.opt("w", "relativenumber", true)
utils.opt("w", "scrolloff", 7)

utils.opt("o", "undofile", true)
utils.opt("o", "undolevels", 10000)
utils.opt("o", "undoreload", 10000)
utils.opt("o", "undodir", os.getenv("HOME") .. "/.config/nvim/undo")
utils.opt("o", "cursorline", true)
