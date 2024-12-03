require("telescope").load_extension("dap")
require("dbg.python")
require("dbg.cpp")

local telescope = require("telescope.builtin")
local utils = require("utils")

utils.map("n", "<Leader>-", "<cmd>ToggleTerm direction=horizontal name=horizontal<CR>")
utils.map("n", "<Leader>|", "<cmd>ToggleTerm direction=vertical name=vertical size=90<CR>")
utils.map("n", "<Leader><Leader>", "<cmd>ToggleTermToggleAll<CR>")
utils.map("n", "<Leader>t", "<cmd>Telescope cmake4vim select_target<cr>")
-- utils.map("n", "<Leader>f", '<cmd>:lua require("utils").format<CR>')

-- vim.keymap.set("n", "<leader>g", telescope.git_files, {})
vim.keymap.set("n", "<leader>m", telescope.find_files, {})
vim.keymap.set("n", "<leader>n", telescope.live_grep, {})
vim.keymap.set("n", "<leader>b", telescope.buffers, {})
-- vim.keymap.set("n", "<leader>h", telescope.help_tags, {})
-- vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", {})

function format()
	if vim.bo.filetype == "rust" then
		vim.cmd("RustFmt")
	else
		vim.cmd("LuaFormat")
	end
end

vim.api.nvim_exec(
	[[
    augroup AutoFormatSourceCode
    autocmd BufWritePre *.rs,*.cpp,*.hpp,*.h,*.c lua vim.lsp.buf.format()
    augroup END
    augroup FormatJson
    autocmd BufWritePre *.json %!python3 -m json.tool
    augroup END
]],
	false
)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
