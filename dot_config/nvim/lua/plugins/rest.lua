return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    result = {
      formatters = {
        json = 'jq',
        html = function(body)
          return vim.fn.system({ 'prettier', '--stdin-filepath', 'index.html' }, body)
        end,
      },
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>x', '<Plug>RestNvim', { desc = 'execute request' })
    vim.keymap.set('n', '<leader>p', '<Plug>RestNvimPreview', { desc = 'preview curl' })
    vim.keymap.set('n', '<leader>l', '<Plug>RestNvimLast', { desc = 'repeat last request' })
  end,
}
