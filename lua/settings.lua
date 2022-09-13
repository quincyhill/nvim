local o = vim.o -- global options
local bo = vim.bo -- buffer local options
local wo = vim.wo -- window local options

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12

-- window local options
wo.number = true
wo.relativenumber = true

-- buffer local options
bo.expandtab = true

