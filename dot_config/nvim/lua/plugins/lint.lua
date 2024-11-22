return {
  'mfussenegger/nvim-lint', -- linting based on lsp
  -- event = 'LazyFile',
  opts = {
    linters_by_ft = {
      ansible = { 'ansible_lint' },
      javascript = { 'biomejs', 'eslint_d', 'snyk_iac' },
      javascriptreact = { 'biomejs', 'eslint_d' },
      shell = { 'shellcheck' },
      typescript = { 'biomejs', 'eslint_d' },
      typescriptreact = { 'biomejs', 'eslint_d' },
      yaml = { 'yamllint' },
      php = { 'phpcs' },
      go = { 'golangcilint' },
      dockerfile = { 'hadolint' },
    },
    linters = {
      eslint_d = {
        args = {
          '--no-warn-ignored',
          '--format',
          'json',
          '--stdin',
          '--stdin-filename',
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local lint = require('lint')
    for name, linter in pairs(opts.linters) do
      if type(linter) == 'table' and type(lint.linters[name]) == 'table' then
        lint.linters[name] = vim.tbl_deep_extend('force', lint.linters[name], linter)
        if type(linter.prepend_args) == 'table' then
          lint.linters[name].args = lint.linters[name].args or {}
          vim.list_extend(lint.linters[name].args, linter.prepend_args)
        end
      else
        lint.linters[name] = linter
      end
    end
    lint.linters_by_ft = opts.linters_by_ft
  end,
  init = function()
    local lint = require('lint')
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
