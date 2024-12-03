--require('dap-python').setup("python")

local utils = require('utils')
local dap = require('dap')


dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
   {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    cwd = "${workspaceFolder}";
    pythonPath = function()
      return 'python'
    end;
  },
}

