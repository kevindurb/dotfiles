return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      typescript = { 'biome', 'prettierd', 'eslint_d' },
      javascript = { 'biome', 'prettierd', 'eslint_d' },
      typescriptreact = { 'biome', 'prettierd', 'eslint_d' },
      javascriptreact = { 'biome', 'prettierd', 'eslint_d' },
      css = { 'prettierd' },
      graphql = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      markdown = { 'prettierd' },
      yaml = { 'prettierd' },
      lua = { 'stylua' },
      php = { 'php_cs_fixer' },
      toml = { 'taplo' },
      cs = { 'dotnetformat' },
      go = { 'gofmt' },
      ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
