local M = {}

M.setup = function()
  -- General
  vim.g.mapleader = ','
  vim.opt.encoding = 'utf-8'
  vim.opt.title = true -- set title in terminal
  vim.opt.wildmode = 'longest:list,full' -- make command completion more like zsh
  vim.opt.autowrite = true -- save when you change buffers
  vim.opt.clipboard = 'unnamedplus' -- copy and paste in system clipboard
  vim.opt.path = '.,src,**' -- gf search current, src and recurrsive dir
  vim.opt.suffixesadd = '.js,/index.js' -- gf try adding .js to files
  vim.opt.updatetime = 300
  vim.opt.mouse = 'a'

  -- Appearence
  vim.opt.colorcolumn = '80' -- color line at 80 columns
  vim.opt.cursorcolumn = true -- turn on cursor vertical line
  vim.opt.cursorline = true -- turn on cursor horizontal line
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
  vim.opt.hlsearch = true -- highlight all search matches
  vim.opt.showmatch = true -- highlight matching brace
  vim.opt.ignorecase = true -- ignore search case
  vim.opt.smartcase = true -- dont ignore case once you use a capital

  -- Undo and backups
  vim.opt.undolevels = 1000 -- holds last 1000 undos
  vim.g.undodir = '~/.vimundodir' -- store undo history in a directory
  vim.opt.undofile = true -- so if i close and reopen a file i can still undo
  vim.g.backupdir = '~/.vimbackup' -- backup files in one place
  vim.g.directory = '~/.vimbackup' -- swp files in one place

  -- turn off bells
  vim.g.eb = false
  vim.g.vb = false
  vim.g.t_vb = false
end

return M
