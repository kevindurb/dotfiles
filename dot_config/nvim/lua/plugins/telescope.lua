return {
  'nvim-telescope/telescope.nvim', -- pretty search
  dependencies = {
    'nvim-lua/plenary.nvim',
    'echasnovski/mini.icons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  opts = function()
    return {
      defaults = { mappings = { i = { ['<Esc>'] = require('telescope.actions').close } } },
      extensions = {
        noice = true,
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    }
  end,
  config = function(lazy, opts)
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup(opts)
    telescope.load_extension('fzf')

    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-o>', builtin.commands, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end,
}
