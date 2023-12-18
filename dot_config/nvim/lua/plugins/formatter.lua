return {
  'mhartington/formatter.nvim', -- auto format files
  opts = function()
    return {
      filetype = {
        typescript = {
          require('formatter.filetypes.typescript').biome,
          require('formatter.filetypes.typescript').prettierd,
          require('formatter.filetypes.typescript').eslint_d,
        },
        javascript = {
          require('formatter.filetypes.javascript').biome,
          require('formatter.filetypes.javascript').prettierd,
          require('formatter.filetypes.javascript').eslint_d,
        },
        typescriptreact = {
          require('formatter.filetypes.typescript').biome,
          require('formatter.filetypes.typescript').prettierd,
          require('formatter.filetypes.typescript').eslint_d,
        },
        javascriptreact = {
          require('formatter.filetypes.javascript').biome,
          require('formatter.filetypes.javascript').prettierd,
          require('formatter.filetypes.javascript').eslint_d,
        },
        css = { require('formatter.filetypes.css').prettierd },
        graphql = { require('formatter.filetypes.graphql').prettierd },
        html = { require('formatter.filetypes.html').prettierd },
        json = { require('formatter.filetypes.json').prettierd },
        lua = { require('formatter.filetypes.lua').stylua },
        markdown = { require('formatter.filetypes.markdown').prettierd },
        php = { require('formatter.filetypes.php').php_cs_fixer },
        yaml = { require('formatter.filetypes.yaml').prettierd },
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
