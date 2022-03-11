local map  = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Save document
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<ESC>:w<CR>a', opts)

-- Toggle Default Functions
map('n', '<Leader><Space>', ':set invhlsearch<CR>', opts)
map('n', '<Leader>rn', ':set invrelativenumber<CR>', opts)
map('n', '<Leader>wr', ':set invwrap<CR>', opts)

-- Telescope
map('n', 'ff', ':Telescope find_files<CR>', opts)
map('n', 'ft', ':Telescope filetypes<CR>', opts)
map('n', 'fm', ':Telescope marks<CR>', opts)
map('n', 'fb', ':Telescope buffers<CR>', opts)
map('n', 'fl', ':Telescope live_grep<CR>', opts)
map('n', 'fs', ':Telescope grep_string<CR>', opts)
map('n', 'fo', ':Telescope vim_options<CR>', opts)
map('n', 'fk', ':Telescope keymaps<CR>', opts)
map('n', 'fj', ':Telescope jumplist<CR>', opts)

-- Tree
map('n', 'tt', ':NvimTreeToggle<CR>', opts)
map('n', 'tf', ':NvimTreeFocus<CR>', opts)


-- LazyGit
map('n', '<Leader>gg', ':LazyGit<CR>', opts)

