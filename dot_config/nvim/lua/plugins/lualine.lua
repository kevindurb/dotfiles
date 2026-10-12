local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('nvim-lualine/lualine.nvim') })

require('lualine').setup({
  extensions = {
    'man',
    'oil',
    'quickfix',
  },
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    section_separators = { left = ' ', right = ' ' },
  },
  sections = {
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype',
      {
        'lsp_status',
        icon = '',
        symbols = {
          spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
          done = '✓',
          separator = ' ',
        },
        ignore_lsp = {},
      },
    },
  },
  inactive_winbar = {
    lualine_c = {
      {
        'filename',
        path = 4,
      },
    },
  },
  winbar = {
    lualine_a = {
      {
        'filename',
        path = 4,
      },
    },
    lualine_c = {
      {
        'navic',
        color_correction = nil,
        navic_opts = nil,
      },
    },
  },
})
