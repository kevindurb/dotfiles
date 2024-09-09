return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'nvim-neotest/nvim-nio',
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },
  },
  config = function()
    local dapui = require('dapui')
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
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
  end,
}
