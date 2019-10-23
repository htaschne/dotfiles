" Basic Configs:
	" Numbers
	set nu
	
	" Edit multiple files
	set hidden
	set noswapfile
	
	" Substitute preview
	set inccommand=split
	
	" Leader 
	let mapleader="\<space>"
	
	" Colorscheme
	set background=dark
	colorscheme PaperColor

	" Just to be clear
	set encoding=utf-8

	" Macros:
	nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
	nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Indentation:
	set shiftwidth=4
	set tabstop=4
	set smartindent
	set autoindent

" Navigation:
	set scrolloff=10
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

" Searches appear in the middle of screen:
	:nnoremap n nzz
	:nnoremap N Nzz
	:nnoremap * *zz
	:nnoremap # #zz
	:nnoremap g* g*zz
	:nnoremap g# g#zz
" Skeleton Files
	source $HOME/dotfiles/vim/skeletons/skeletons.vim
" Dein plugins: cmd ---> call dein#install()
	if &compatible
	  set nocompatible
	endif
	
	set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
	
	if dein#load_state('~/.cache/dein')
	  	call dein#begin('~/.cache/dein')
	
	  	call dein#add('terryma/vim-multiple-cursors')
	  	call dein#add('scrooloose/nerdtree')
	  	call dein#add('airblade/vim-gitgutter')
	  	call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
	  	call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
		call dein#add('neovimhaskell/haskell-vim')
		call dein#add('jiangmiao/auto-pairs')
		call dein#add('scrooloose/nerdcommenter')
		call dein#add('NLKNguyen/papercolor-theme')
	
	  	call dein#end()
	  	call dein#save_state()
	endif

" Dein requirements:
	filetype plugin indent on
	syntax enable

" NERDTree:
	map <leader>t :NERDTreeToggle<CR>

" Vim gutter:
	set updatetime=50  " update vim
	set signcolumn=yes
	
	" Signs
	let g:gitgutter_map_keys = 0
	let g:gitgutter_sign_added = '▋'
	let g:gitgutter_sign_modified = '▋'
	let g:gitgutter_sign_removed = '▋'
	let g:gitgutter_sign_modified_removed = '▋'
	let g:gitgutter_sign_removed_first_line = '▔'
	
	" Colors
	hi SignColumn ctermfg=187 ctermbg=NONE guifg=#ebdbb2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
	highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
	highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
	highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
	highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" fzf
nnoremap <c-p> :Files<cr>

" Ag
nnoremap <c-f> :Ag<space>
