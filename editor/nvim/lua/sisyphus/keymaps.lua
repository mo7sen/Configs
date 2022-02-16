local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    n = Normal
--    i = Insert
--    v = Visual
--    x = VisualBlock
--    t = Term
--    c = Command

-- Normal --
-- Window Navigation --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Splits --
keymap("n", "<M-v>", ":vsplit<cr>", opts)
keymap("n", "<M-s>", ":split<cr>", opts)

-- Resize splits --
keymap("n", "<M-k>", ":resize +2<cr>", opts)
keymap("n", "<M-j>", ":resize -2<cr>", opts)
keymap("n", "<M-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<M-l>", ":vertical resize +2<cr>", opts)

-- Navigate buffers --
keymap("n", "<leader>j", ":bnext<cr>", opts)
keymap("n", "<leader>k", ":bprevious<cr>", opts)
keymap("n", "<leader>d", ":bdelete<cr>", opts)

-- Faster command --
keymap("n", ";", ":", { noremap = true })

-- Move lines --
keymap("n", "<Left>", "<<", opts)
keymap("n", "<Right>", ">>", opts)
keymap("n", "<Up>", "dd2kp", opts)
keymap("n", "<Down>", "ddp", opts)

-- Insert --
-- Quicker escape --
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode --
keymap("v", "<Left>", "<gv", opts)
keymap("v", "<Right>", ">gv", opts)

-- Move text up and down
keymap("v", "<Up>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<Down>", ":move '>+1<CR>gv-gv", opts)

-- Paste overwrite selection
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
