" This is to set the tabwidth to 4 
set tabstop=4

" Tab space to 4 characters
set softtabstop=4

" Shifts over 4 characters
set shiftwidth=4

" Does its best to autoindent
set smartindent

" Sets number line
set number

" Sets relative number line
set relativenumber

" Set Splitbelow so it only goes below
set splitbelow

" Set split right so files split to the right
set splitright

" Set title, IDK if I need this in neo vim since it shows but whatever
set title

" FOR WINDOWS
" Since vimplug might work different on windows im leaving it out for the time
" being
" Plugins will be downloaded under the specified directory.
" call plug#begin('~/.data/plugged')

" Declare the list of plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
" call plug#end()


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (defualt is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completions-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif


