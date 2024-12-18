local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

	buf_set_keymap("n", "<space>gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
	buf_set_keymap("n", "<space>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<space>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<space>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("i", "<space>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<space>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

--local cmp = require("cmp")
--cmp.setup({
--	snippet = {
--		-- REQUIRED - you must specify a snippet engine
--		expand = function(args)
--			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--		end,
--	},
--	window = {
--		-- completion = cmp.config.window.bordered(),
--		-- documentation = cmp.config.window.bordered(),
--	},
--	mapping = cmp.mapping.preset.insert({
--		["<C-b>"] = cmp.mapping.scroll_docs(-4),
--		["<C-f>"] = cmp.mapping.scroll_docs(4),
--		["<C-Space>"] = cmp.mapping.complete(),
--		["<C-e>"] = cmp.mapping.abort(),
--		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--	}),
--	sources = cmp.config.sources({
--		{ name = "nvim_lsp" },
--		{ name = "vsnip" }, -- For vsnip users.
--		-- { name = 'luasnip' }, -- For luasnip users.
--		-- { name = 'ultisnips' }, -- For ultisnips users.
--		-- { name = 'snippy' }, -- For snippy users.
--	}, {
--		{ name = "buffer" },
--	}),
--})
--
---- Set configuration for specific filetype.
--cmp.setup.filetype("gitcommit", {
--	sources = cmp.config.sources({
--		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
--	}, {
--		{ name = "buffer" },
--	}),
--})
--
---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline("/", {
--	mapping = cmp.mapping.preset.cmdline(),
--	sources = {
--		{ name = "buffer" },
--	},
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(":", {
--	mapping = cmp.mapping.preset.cmdline(),
--	sources = cmp.config.sources({
--		{ name = "path" },
--	}, {
--		{ name = "cmdline" },
--	}),
--})
--
--local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
nvim_lsp.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
		--            "--log=verbose",
		"--query-driver='/opt/homebrew/opt/llvm/bin/clang++'",
		"--background-index",
	},
	filetypes = { "c", "cpp", "h", "hpp" },
	root_dir = require("lspconfig/util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})
