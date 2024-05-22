return {
  'someone-stole-my-name/yaml-companion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  init = function()
    require('telescope').load_extension('yaml_schema')
  end,
}
