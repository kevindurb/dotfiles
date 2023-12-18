return {
  'alvan/vim-closetag', -- autoclose tags
  enable = false,
  init = function()
    vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx,*.js'
  end,
}
