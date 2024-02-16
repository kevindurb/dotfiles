local options = {
  ensure_installed = {
    'ansible-language-server',
    'ansible-lint',
    'bash-language-server',
    'biome',
    'css-lsp',
    'dockerfile-language-server',
    'eslint-lsp',
    'eslint_d',
    'firefox-debug-adapter',
    'graphql-language-service-cli',
    'html-lsp',
    'intelephense',
    'js-debug-adapter',
    'json-lsp',
    'lua-language-server',
    'marksman',
    'openscad-lsp',
    'php-cs-fixer',
    'php-debug-adapter',
    'phpstan',
    'prettierd',
    'shellcheck',
    'sqlfluff',
    'sqlls',
    'stylelint',
    'stylua',
    'typescript-language-server',
    'yaml-language-server',
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
