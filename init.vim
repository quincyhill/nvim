if !exists('g:vscode')

	" Settings for general files

	" for global clipboard
	set clipboard=unnamedplus
	
	" Shifts over 4 characters
	set shiftwidth=4

	" This is to set the tabwidth to 4 
	set tabstop=4	

	" Tab space to be 4 characters
	set softtabstop=4

	" Does its best to autoindent
	set smartindent
	
	" Enable filetype plugins
	filetype plugin on
	filetype indent on
	
	" See if this does anything else to indent
	set autoindent
	
	" Sets number line
	set number
	
	" Sets relative number line
	set relativenumber
	
	" Setting highlight search
	set hlsearch
	hi Search ctermbg=Yellow
	hi Search ctermfg=Black
	
	" Set Splitbelow so it only goes below
	set splitbelow
	
	" Set split right so files split to the right
	set splitright
	
	" Set title
	set title
	
	" Sets where all the vim-plug plugins will be sent to
	call plug#begin('~/.data/plugged')
	
	" All the installed plugins
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'prettier/vim-prettier', {'do': 'npm install'}
	Plug 'mattn/emmet-vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'tomlion/vim-solidity'
	Plug 'udalov/kotlin-vim'
	
	" List ends here. Plugins become visible to Vim after this call.
	call plug#end()
	
	" ### THIS IS FOR COC VIM ###
	
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

	" For web files
	
	" Fix tsx spacing
	autocmd! BufNewFile,BufReadPre,FileReadPre *.tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix jsx spacing
	autocmd! BufNewFile,BufReadPre,FileReadPre *.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix typescript spacing
	autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix javascript spacing
	autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix css spacing
	autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix json spacing
	autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix html spacing
	autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Have prettier run after writing to a typescript file
	autocmd BufWritePost *.ts :Prettier
	
	" Have prettier run after writing to a typescript file
	autocmd BufWritePost *.js :Prettier
	
	" Have prettier run after writing to HTML file
	autocmd BufWritePost *.html :Prettier
	
	" Have prettier run after writing to JSX file
	autocmd BufWritePost *.jsx :Prettier
	
	" Have prettier run after writing to TSX file
	autocmd BufWritePost *.tsx :Prettier
	
	" Have prettier run after writing to CSS file
	autocmd BufWritePost *.css :Prettier
	
	" This is for jsx and tsx for syntax highlighting
	autocmd BufNewFile,BufRead *.tsx, *.jsx set filetype=typescript.tsx
	
	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1] =~# '\s'
	endfunction
	
	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()
	
	" Use <cr> to confirm completion. `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif
	
	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
	" list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)]
	nmap <silent> ]g <Plug>(coc-diagnostic-next)]
	
	" GoTo code navigation
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	
	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	
	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call function('doHover')
		endif
	endfunction
	
	" Highlight the symbol and its references when holding the cursor
	autocmd CursorHold * silent call CocActionAsync('highlight')
	
	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)
	
	" Formatting selected code.
	xmap <leader>f <Plug>(coc-format-selected)
	nmap <leader>f <Plug>(coc-format-selected)
	
	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end
	
	" Applying codeAction to the selected region.
	" Example: `<leader>app` for current paragraph. 
	xmap <leader>a <Plug>(coc-codeaction-selected)
	nmap <leader>a <Plug>(coc-codeaction-selected)
	
	" Remap keys for applying codeAction to the current buffer.
	nmap <leader>ac <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf <Plug>(coc-fix-current)
	
	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language
	" server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)
	
	" use CTRL-S for selections ranges.
	" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)
	
	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')
	
	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call CocAction('fold',<f-args>)
	
	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR :call CocAction('runCommand','editor.action.organizeImport')
	
	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
	
	" Mappings for CoCList
	" Show all diagnostics
	nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
	" Manage extentions.
	nnoremap <silent><nowait> <space>e :<C-u>CocList extentions<cr>
	" Show commands
	nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent><nowait> <space>j :<C-u>CocNext<cr>
	" Do default action for previous item.
	nnoremap <silent><nowait> <space>k :<C-u>CocPrev<cr>
	" Resume latest coc list.
	nnoremap <silent><nowait> <space>p :<C-u>CocListResume<cr>
	
	" Change the background color to #e4e4e4, aka a light grey
	highlight Pmenu ctermbg=255 guibg=255 
else
	" This is for vscode nvim settings
	
	" Settings for general files
	
	" This is to set the tabwidth to 4 
	set tabstop=4
	
	" for global clipboard
	set clipboard=unnamedplus
	
	" Shifts over 4 characters
	set shiftwidth=4

	" Tab space to be 4 characters
	set softtabstop=4

	" For web files

	" Fix tsx spacing
	autocmd! BufNewFile,BufReadPre,FileReadPre *.tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix jsx spacing
	autocmd! BufNewFile,BufReadPre,FileReadPre *.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix typescript spacing
	autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix javascript spacing
	autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix css spacing
	autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix json spacing
	autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2
	
	" Fix html spacing
	autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
endif
