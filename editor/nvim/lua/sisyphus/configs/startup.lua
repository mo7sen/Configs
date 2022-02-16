return function()
  local status_ok, startup = pcall(require, 'startup')
  if not status_ok then
    return
  end

  startup.setup{
    theme = 'dashboard',
    options = {
        mapping_keys = false, -- display mapping (e.g. <leader>ff)
        disable_statuslines = true, -- disable status-, buffer- and tablines
    }
  }
end
