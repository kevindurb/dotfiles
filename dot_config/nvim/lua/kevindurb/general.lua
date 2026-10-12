-- General
vim.g.mapleader = ','
vim.opt.title = true -- set title in terminal
vim.opt.autowrite = true -- save when you change buffers
vim.opt.clipboard = 'unnamedplus' -- copy and paste in system clipboard
vim.opt.path = '.,src,**' -- gf search current, src and recurrsive dir
vim.opt.suffixesadd = '.js,/index.js' -- gf try adding .js to files
vim.opt.updatetime = 300
vim.opt.backupcopy = 'yes'

-- Appearence
vim.opt.number = true -- but still show current line number
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.showtabline = 2 -- always show the tabline
vim.opt.signcolumn = 'yes' -- always show the gutter
vim.opt.termguicolors = true -- better colors??
vim.wo.wrap = false -- NO WRAPPING LINES

-- Indentation
vim.opt.smartindent = true -- auto indents c-like blocks
vim.opt.shiftround = true -- round indent to shiftwidth
vim.opt.tabstop = 2 -- columns per tab
vim.opt.shiftwidth = 2 -- spaces per indent
vim.opt.softtabstop = 2 -- spaces per tab
vim.opt.expandtab = true -- use soft tabs

-- Searching
vim.opt.infercase = true
vim.opt.showmatch = true -- highlight matching brace
vim.opt.ignorecase = true -- ignore search case
vim.opt.smartcase = true -- dont ignore case once you use a capital

-- Undo and backups
vim.opt.undofile = true -- so if i close and reopen a file i can still undo

-- Split behavior settings
vim.opt.splitbelow = true -- horizontal splits open down
vim.opt.splitright = true -- vertical splits open right

-- Enable Treesitter Highlighting
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Enable Treesitter Folding
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

-- Diagnostic Signs
vim.diagnostic.config({
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
})
