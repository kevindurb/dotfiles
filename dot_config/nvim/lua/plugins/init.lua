-- Just basic plugins that dont need
-- any setup
return {
  'tpope/vim-fugitive', -- git commands in vim
  'tpope/vim-repeat', -- repeating plugin commands
  'tpope/vim-unimpaired', -- mappings for things with '['
  'tpope/vim-eunuch', -- helpful unixy commands
  'tpope/vim-abolish', -- messing with words and casing
  'godlygeek/tabular', -- auto alignment
  { 'NoahTheDuke/vim-just', ft = 'just' }, -- justfile
  { 'Glench/Vim-Jinja2-Syntax', ft = 'jinja2' }, -- jinja2 syntax
  'isobit/vim-caddyfile', -- caddyfile highlighting
  'lukas-reineke/indent-blankline.nvim', -- indent guides
}
