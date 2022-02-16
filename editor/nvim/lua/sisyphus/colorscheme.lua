vim.g.vscode_style = "dark"
vim.g.vscode_italic_comment = 0 -- Recommended ( Unfortunately, causes clipping with neovim-qt and FiraCode )
vim.g.vscode_transparent = false

local colorscheme = "vscode"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
