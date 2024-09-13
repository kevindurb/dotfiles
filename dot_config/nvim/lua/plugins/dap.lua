return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  -- stylua: ignore
  keys = {
    { '<F2>', function() require('dap').step_over() end, desc = 'Step Over' },
    { '<F3>', function() require('dap').step_into() end, desc = 'Step Into' },
    { '<F4>', function() require('dap').step_out() end, desc = 'Step Out' },
    { '<F5>', function() require('dap').continue() end, desc = 'Continue' },
    { '<F6>', function() require('dap').close(); require('dapui').close() end, desc = 'Close' },
    { '<F10>', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
  },
  config = function()
    local dap = require('dap')
    -- dap.adapters['pwa-node'] = {
    --   type = 'server',
    --   host = '127.0.0.1',
    --   port = 8123,
    --   executable = {
    --     command = 'js-debug-adapter',
    --   },
    -- }
    --
    -- dap.adapters['firefox'] = {
    --   type = 'executable',
    --   command = 'firefox-debug-adapter',
    -- }
    --
    dap.adapters.php = {
      type = 'executable',
      command = 'php-debug-adapter',
    }
    --
    -- dap.configurations.php = {
    --   {
    --     type = 'php',
    --     request = 'launch',
    --     name = 'Listen for Xdebug',
    --     port = 9000,
    --     pathMappings = {
    --       ['/var/www'] = '${workspaceFolder}',
    --     },
    --     xdebugSettings = {
    --       max_data = 100000,
    --       max_children = 1000,
    --       max_depth = 5,
    --       show_hidden = 1,
    --     },
    --   },
    -- }
    --
    -- for _, language in ipairs({ 'typescript', 'javascript' }) do
    --   require('dap').configurations[language] = {
    --     {
    --       type = 'pwa-node',
    --       request = 'launch',
    --       name = 'Launch node',
    --       program = '${file}',
    --       cwd = '${workspaceFolder}',
    --       runtimeExecutable = 'node',
    --     },
    --     {
    --       type = 'pwa-node',
    --       request = 'attach',
    --       name = 'Attach node',
    --       processId = require('dap.utils').pick_process,
    --       cwd = '${workspaceFolder}',
    --     },
    --     {
    --       type = 'firefox',
    --       request = 'attach',
    --       name = 'Attach firefox',
    --       cwd = '${workspaceFolder}',
    --     },
    --   }
    -- end

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapBreakpointRejected',
      { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' }
    )
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapStopped',
      { text = '▶️', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = 'DiagnosticSignWarn' }
    )

    -- setup dap config by VsCode launch.json file
    local vscode = require('dap.ext.vscode')
    local json = require('plenary.json')
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    -- Extends dap.configurations with entries read from .vscode/launch.json
    if vim.fn.filereadable('.vscode/launch.json') then
      vscode.load_launchjs()
    end
  end,
}
