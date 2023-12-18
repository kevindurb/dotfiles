local filetypes = {
  'css',
  'html',
  'typescript',
  'openscad',
}

return {
  'NvChad/nvim-colorizer.lua', -- colorize css colors
  ft = filetypes,
  opts = {
    filetypes = filetypes,
  },
}
