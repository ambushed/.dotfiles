local dap = require('dap')
local dap_ext = require('dap.ext.vscode')

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = "lldb"
}

dap_ext.load_launchjs(nil, { lldb={'c','cpp'} })

