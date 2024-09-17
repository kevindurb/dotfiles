return {
  'stevearc/conform.nvim',
  opts = function()
    return {
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
      },
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
    }
  end,
}
