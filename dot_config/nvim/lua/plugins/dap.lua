return {
  'mfussenegger/nvim-dap', -- debugging
  config = function()
    local dap = require('dap')
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = '127.0.0.1',
      port = 8123,
      executable = {
        command = 'js-debug-adapter',
      },
    }

    dap.adapters['firefox'] = {
      type = 'executable',
      command = 'firefox-debug-adapter',
    }

    for _, language in ipairs({ 'typescript', 'javascript' }) do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch node',
          program = '${file}',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'node',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach node',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'firefox',
          request = 'attach',
          name = 'Attach firefox',
          cwd = '${workspaceFolder}',
        },
      }
    end
  end,
}
