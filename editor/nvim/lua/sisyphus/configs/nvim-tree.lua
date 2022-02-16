return function()
  vim.cmd [[
    let g:nvim_tree_disable_window_picker = 1
    let g:nvim_tree_show_icons = {
        \ 'git': 1,
        \ 'folders': 1,
        \ 'files': 1,
        \ 'folder_arrows': 1,
        \ }
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
        \   'arrow_open': "",
        \   'arrow_closed': "",
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   }
        \ }
  ]]
  require'nvim-tree'.setup {
    open_on_setup = true,
    auto_close = true,
    git = {
      enable = true,
      ignore = false,
    },
  }
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
end

