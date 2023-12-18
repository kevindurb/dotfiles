local M = {}

M.setup = function()
  -- if you have rg use rg for vimgrep
  vim.cmd([[
    if executable('rg')
      set grepprg=rg\ --vimgrep
    endif

    " Rg command for searching in vim
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!

    " Auto open quickfix after search
    augroup quickfix
        autocmd!
        autocmd QuickFixCmdPost [^l]* cwindow
        autocmd QuickFixCmdPost l* lwindow
    augroup END

    " K keymap for searching word under cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  ]])
end

return M
