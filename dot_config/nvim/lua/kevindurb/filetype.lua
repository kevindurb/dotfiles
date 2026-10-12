local autocmd = vim.api.nvim_create_autocmd

-- Spelling in markdown and commit messages
autocmd('FileType', {
  pattern = { 'markdown', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
  desc = 'Enable spell checking for markdown and git commit messages',
})

-- Word wrap for markdown
autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
  end,
  desc = 'Enable word wrap for markdown files',
})

vim.filetype.add({
  extension = {
    tmpl = 'gotmpl',
    gotmpl = 'gotmpl',
    gohtml = 'gotmpl',
  },
})

vim.filetype.add({
  extension = {
    ocl = 'hcl',
  },
})
