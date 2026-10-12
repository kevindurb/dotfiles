local function pack_names()
  return vim
    .iter(vim.pack.get())
    :map(function(p)
      return p.spec.name
    end)
    :totable()
end

-- :PackUpdate [name]  — update all or a specific plugin
vim.api.nvim_create_user_command('PackUpdate', function(opts)
  local names = #opts.fargs > 0 and opts.fargs or nil
  vim.pack.update(names)
end, {
  nargs = '*',
  complete = pack_names,
  desc = 'Update vim.pack plugins',
})

-- :PackClean [name]  — remove inactive plugins (on disk but not added this session)
vim.api.nvim_create_user_command('PackClean', function(opts)
  if #opts.fargs > 0 then
    vim.pack.del(opts.fargs)
    return
  end

  local names = vim
    .iter(vim.pack.get())
    :filter(function(p)
      return not p.active
    end)
    :map(function(p)
      return p.spec.name
    end)
    :totable()

  if #names == 0 then
    vim.notify('vim.pack: nothing to clean', vim.log.levels.INFO)
    return
  end

  vim.notify('Cleaning: ' .. table.concat(names, ', '), vim.log.levels.INFO)
  vim.pack.del(names)
end, {
  nargs = '*',
  complete = pack_names,
  desc = 'Remove inactive/orphaned vim.pack plugins from disk',
})

-- :PackList  — show all managed plugins and their status
vim.api.nvim_create_user_command('PackList', function()
  local plugins = vim.pack.get()
  if #plugins == 0 then
    vim.notify('vim.pack: no plugins', vim.log.levels.WARN)
    return
  end

  local lines = vim
    .iter(plugins)
    :map(function(p)
      local status = p.active and '+' or '-'
      return ('[%s] %s  %s'):format(status, p.spec.name, p.spec.src or '')
    end)
    :totable()

  table.sort(lines)
  vim.notify(table.concat(lines, '\n'), vim.log.levels.INFO)
end, { desc = 'List vim.pack plugins' })
