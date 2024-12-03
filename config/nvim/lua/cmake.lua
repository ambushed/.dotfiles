local utils = require("utils")

vim.g.cmake_build_executor = "term"
vim.g.cmake_build_executor_height = "20"
vim.g.cmake_build_dir = "build"
vim.g.make_arguments = "-j8"

utils.map("n", "<leader>ct", "<cmd>lua require('telescope').extensions.cmake4vim.select_target{}<CR>")
utils.map("n", "<leader>cb", "<cmd>CMakeBuild<CR>")
utils.map("n", "<leader>cc", "<cmd>lua require('telescope').extensions.cmake4vim.select_build_type{}<CR>")

Run_cmake = function(config)
	vim.cmd("CMakeReset")
	vim.cmd("CMakeSelectBuildType " .. config)
	require("os").execute("sleep 1")
	vim.cmd("CMakeSelectTarget compile_commands.json")
	require("os").execute("sleep 1")
	vim.cmd("CMakeBuild")
	require("os").execute("sleep 1")
end
