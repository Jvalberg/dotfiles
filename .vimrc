" 
" Vim settings
" required by vundle
"
set nocompatible	" be iMproved, required	
filetype off		" required by Vundle

"
" Vundle Plugin Manager setup
"
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Include all plguins here

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' 		" The Plugin Manager
Plugin 'tpope/vim-sensible'		" Sensible default settings for vim.
Plugin 'ervandew/supertab'		" To get YCM and Ultisnips to play nicely with tab
Plugin 'Valloric/YouCompleteMe'		" Autocomplete for languages
Plugin 'SirVer/ultisnips'		" Snippet inserter
Plugin 'honza/vim-snippets'		" Pre-created snippets
Plugin 'scrooloose/nerdtree' 		" File-tree browser
Plugin 'tomtom/tcomment_vim' 		" Comment lines of code
Plugin 'vim-scripts/a.vim' 		" A fast way to switch between .h and .c
Plugin 'wincent/Command-T' 		" Open files with fuzzy search
Plugin 'altercation/vim-colors-solarized' " Solarized theme for vim.


" All plugins must be added before this
call vundle#end()		" required
filetype plugin indent on 	" required
"
" Supertab Settings
"
let g:SuperTabDefaultCompletionType = '<C-n>'

"
" YouCompleteMe settings
"
let g:ycm_autoclose_preview_window_after_completion = 0
" Get YCM to play nicely with ultisnips using supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"
" UltiSnips settings
"
let g:UltiSnipsEpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"
" NERDTree settings
"
map <F2> :NERDTreeToggle<CR>

" 
" Vim settings
"
set hidden 		" Allows buffer to be hidden when modified
set number 		" Shows line numbers

syntax enable
if has('gui_running')
	set background=dark
	colorscheme solarized
	set guifont=Monaco\ 12
	set guioptions-=T 	" Removes the toolbar
endif
