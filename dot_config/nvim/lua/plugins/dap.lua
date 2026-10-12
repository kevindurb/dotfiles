local gh = require('kevindurb.utils').gh
vim.pack.add({
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-neotest/nvim-nio'),
  gh('theHamsta/nvim-dap-virtual-text'),
  gh('rcarriga/nvim-dap-ui'),
  gh('mfussenegger/nvim-dap'),
})

vim.schedule(function()
  require('nvim-dap-virtual-text').setup()
  local dapui = require('dapui')
  local dap = require('dap')
  dapui.setup()

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
  vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
  vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
  vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
  vim.fn.sign_define(
    'DapStopped',
    { text = '', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = 'DiagnosticSignWarn' }
  )
end)
