return {
  enabled = false,
  'mhartington/formatter.nvim', -- auto format files
  opts = function()
    local util = require('formatter.util')
    local defaults = require('formatter.defaults')
    local typescript = require('formatter.filetypes.typescript')
    local javascript = require('formatter.filetypes.javascript')

    return {
      filetype = {
        typescript = {
          typescript.biome,
          typescript.prettierd,
          typescript.eslint_d,
        },
        javascript = {
          javascript.biome,
          javascript.prettierd,
          javascript.eslint_d,
        },
        typescriptreact = {
          typescript.biome,
          typescript.prettierd,
          typescript.eslint_d,
        },
        javascriptreact = {
          javascript.biome,
          javascript.prettierd,
          javascript.eslint_d,
        },
        css = { require('formatter.filetypes.css').prettierd },
        graphql = { require('formatter.filetypes.graphql').prettierd },
        html = { require('formatter.filetypes.html').prettierd },
        json = { require('formatter.filetypes.json').prettierd },
        lua = { require('formatter.filetypes.lua').stylua },
        markdown = { require('formatter.filetypes.markdown').prettierd },
        php = { require('formatter.filetypes.php').php_cs_fixer },
        yaml = { require('formatter.filetypes.yaml').prettierd },
        pug = { util.copyf(defaults.prettierd) },
        toml = { require('formatter.filetypes.toml').taplo },
        cs = { require('formatter.filetypes.cs').dotnetformat },
        go = { require('formatter.filetypes.go').gofmt },
      },
      ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
    }
  end,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      command = 'FormatWriteLock',
    })
  end,
}
