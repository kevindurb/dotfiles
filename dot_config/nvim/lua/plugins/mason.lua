local options = {
  ensure_installed = {
    'ansible-lint',
    'biome',
    'eslint_d',
    'firefox-debug-adapter',
    'js-debug-adapter',
    'php-cs-fixer',
    'php-debug-adapter',
    'phpstan',
    'prettierd',
    'shellcheck',
    'sqlfluff',
    'stylelint',
    'stylua',
    'yamlfmt',
    'yamllint',
  },
}

return {
  'williamboman/mason.nvim', -- manages external editor tools
  opts = options,
  init = function()
    vim.api.nvim_create_user_command('MasonInstallAll', function()
      vim.cmd('MasonInstall ' .. table.concat(options.ensure_installed, ' '))
    end, {})
  end,
}
