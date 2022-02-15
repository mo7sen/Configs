local opt = vim.opt

opt.backup = false                                             -- Backup file creation
opt.clipboard = "unnamedplus"                    -- Using system clipboard
opt.cmdheight = 2
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"          -- File encoding
opt.hlsearch = true                                            -- Highlight search matches
opt.ignorecase = true                                  -- Ignore case in search patterns
opt.mouse = "a"                                                    -- Use mouse in neovim
opt.pumheight = 10                                             -- Pop-up menu height
opt.showmode = false                                   -- Show mode name
opt.showtabline = 2                                            -- Show tabs
opt.smartcase = true                                   -- Override ignorecase when needed
opt.smartindent = true                         -- Smarter indentation
opt.splitbelow = true                                  -- Horizontal splits go below
opt.splitright = true                                  -- Vertical split go right
opt.swapfile = false                                   -- Swap file creation
opt.termguicolors = true
opt.timeoutlen = 1000                                  -- Time to wait for a mapped sequence to complete
opt.undofile = true                                            -- Persistent undo history
opt.updatetime = 300                                   -- Faster completion (ms)
opt.writebackup = false                                -- 
opt.expandtab = true                                   -- Convert tabs to spaces
opt.shiftwidth = 2                                             -- Number of spaces per indentation
opt.tabstop = 2                                                    -- Insert spaces per tab
opt.cursorline = true                                  -- Highlight the current line
opt.number = true                                                -- Set numbered lines
opt.relativenumber = false                                     -- Set relative numbered lines
opt.numberwidth = 4                                            -- Set number column width
opt.signcolumn = "yes"                         -- Always show sign column
opt.wrap = false                                                 -- Text wrapping
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "monospace:h17"                    -- Font in graphical vim
opt.lazyredraw = true              -- Don't draw in the middle of bindings/macros

opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]            -- Don't treat `-` as a word separator
vim.cmd [[set formatoptions-=cro]]
