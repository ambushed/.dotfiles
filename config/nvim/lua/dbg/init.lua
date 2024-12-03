require('telescope').load_extension('dap')

require('dbg.python')
require('dbg.cpp')
require("nvim-dap-virtual-text").setup()

require"dapui".setup()

local utils = require('utils')

-- telescope-dap
utils.map('n', '<leader>dg', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
utils.map('n', '<leader>db', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
--utils.map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')

utils.map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
utils.map('n', 'S-F5', '<cmd>lua require"dap".continue()<CR>')
utils.map('n', '<F12>', '<cmd>lua require"dap".close()<CR>')
utils.map('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
utils.map('n', '<F9>', '<cmd>lua require"dap".step_into()<CR>')
utils.map('n', '<s-F11>', '<cmd>lua require"dap".step_out()<CR>')
utils.map('n', '<F7>', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

utils.map('n', '<leader>S','<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

utils.map('n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
utils.map('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
utils.map('n', '<leader>dv', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

utils.map('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
utils.map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
utils.map('n', '<F8>', '<cmd>lua require"dap".repl.toggle()<CR>')
utils.map('n', '<F3>', '<cmd>lua require"dap".repl.run_last()<CR>')

-- dap ui
utils.map('n', '<leader>uo', '<cmd>lua require"dapui".open()<CR>')
utils.map('n', '<leader>uc', '<cmd>lua require"dapui".close()<CR>')

require"dap".defaults.fallback.terminal_win_cmd = 'vsplit new'

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- require("mason").setup()
-- require("mason-nvim-dap").setup()
