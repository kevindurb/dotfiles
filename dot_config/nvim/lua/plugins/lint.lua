local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('mfussenegger/nvim-lint') })

vim.schedule(function()
  local lint = require('lint')
  lint.linters_by_ft = {
    ansible = { 'ansible_lint' },
    bash = { 'shellcheck' },
    dockerfile = { 'hadolint' },
    go = { 'golangcilint' },
    javascript = { 'eslint_d', 'biomejs' },
    javascriptreact = { 'eslint_d', 'biomejs' },
    php = { 'phpcs' },
    sh = { 'shellcheck' },
    sql = { 'sqlfluff' },
    typescript = { 'eslint_d', 'biomejs' },
    typescriptreact = { 'eslint_d', 'biomejs' },
    yaml = { 'yamllint' },
    zsh = { 'shellcheck' },
  }
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
      lint.try_lint(nil, { ignore_errors = true })
    end,
  })
end)
