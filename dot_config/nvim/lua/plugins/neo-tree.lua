return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    close_if_last_window = true,
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
  init = function()
    vim.keymap.set('n', '-', function()
      require('neo-tree.command').execute({ action = 'focus', reveal = true })
    end, { desc = 'Toggle Neotree' })
  end,
}
