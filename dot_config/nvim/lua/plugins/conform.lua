local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('stevearc/conform.nvim') })

vim.schedule(function()
  require('conform').setup({
    formatters = {
      eslint_d = {
        require_cwd = true,
        cwd = require('conform.util').root_file({
          '.eslint.js',
          '.eslint.cjs',
          '.eslint.yaml',
          '.eslint.yml',
          '.eslint.json',
        }),
      },
      php_cs_fixer = {
        cwd = require('conform.util').root_file({
          '.php-cs-fixer.dist.php',
        }),
      },
    },
    formatters_by_ft = {
      css = { 'prettierd' },
      go = { 'gofmt' },
      graphql = { 'prettierd' },
      html = { 'prettierd' },
      javascript = { 'prettierd', 'eslint_d' },
      javascriptreact = { 'prettierd', 'eslint_d' },
      json = { 'prettierd' },
      lua = { 'stylua' },
      markdown = { 'prettierd' },
      php = { 'php_cs_fixer' },
      toml = { 'taplo' },
      typescript = { 'prettierd', 'eslint_d' },
      typescriptreact = { 'prettierd', 'eslint_d' },
      yaml = { 'prettierd' },
      ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  })
end)
