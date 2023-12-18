return {
  'mfussenegger/nvim-lint', -- linting based on lsp
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      ansible = { 'ansible-lint' },
      javascript = { 'biomejs', 'eslint_d' },
      javascriptreact = { 'biomejs', 'eslint_d' },
      shell = { 'shellcheck' },
      typescript = { 'biomejs', 'eslint_d' },
      typescriptreact = { 'biomejs', 'eslint_d' },
      yaml = { 'yamllint' },
      php = { 'phpcs' },
    }
  end,
  init = function()
    local lint = require('lint')
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
