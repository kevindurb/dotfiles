return {
  'rcarriga/nvim-dap-ui', -- debugging ui
  dependencies = {
    'mfussenegger/nvim-dap', -- debugging
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

    vim.keymap.set('n', '<F5>', function()
      dap.continue()
    end)

    vim.keymap.set('n', '<F2>', function()
      dap.step_over()
    end)

    vim.keymap.set('n', '<F3>', function()
      dap.step_into()
    end)

    vim.keymap.set('n', '<F4>', function()
      dap.step_out()
    end)

    vim.keymap.set('n', '<F6>', function()
      dap.close()
      require('dapui').close()
    end)

    vim.keymap.set('n', '<F10>', function()
      dap.toggle_breakpoint()
    end)

    vim.keymap.set('n', '<Leader>dr', function()
      dap.repl.open()
    end)

    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
      widgets.hover()
    end)

    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
      widgets.preview()
    end)

    vim.keymap.set('n', '<Leader>df', function()
      widgets.centered_float(widgets.frames)
    end)

    vim.keymap.set('n', '<Leader>ds', function()
      widgets.centered_float(widgets.scopes)
    end)
  end,
}
