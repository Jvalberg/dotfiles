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
Plugin 'kien/ctrlp.vim'			" Open files and buffers with fuzzy search.
Plugin 'JazzCore/ctrlp-cmatcher'		" Improved matcher for CtrlP
Plugin 'altercation/vim-colors-solarized' " Solarized theme for vim.
Plugin 'tpope/vim-fugitive' 		" Git wrapper
Plugin 'vim-utils/vim-man'		" Man page viewer for vim
Plugin 'vim-airline/vim-airline'	" A better status bar for vim (git integration).
Plugin 'bling/vim-bufferline'	" Shows open buffers in statusbar
Plugin 'easymotion/vim-easymotion'	" Faster way to traverse file to specific locaiton.
Plugin 'haya14busa/incsearch.vim'		" Highlights all searhc matches
Plugin 'haya14busa/incsearch-fuzzy.vim' " Enables fuzzy search
Plugin 'tpope/vim-surround'				" Enables d/c surrounding to tags/different stuff.

" All plugins must be added before this
call vundle#end()		" required
filetype plugin indent on 	" required

"
" YouCompleteMe settings
"
let g:ycm_autoclose_preview_window_after_completion = 0
" Get YCM to play nicely with ultisnips using supertab
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']

"
" NERDTree settings
"
let g:NERDTreeQuitOnOpen=1

"
" Supertab Settings
"
let g:SuperTabDefaultCompletionType = '<C-n>'

"
" Incsearch settings
"
set hlsearch
let g:incsearch#auto_nohlsearch = 1

"
" Incsearch settings
"
let g:EasyMotion_do_mapping = 0 " Disable default mapping
let g:EasyMotion_smartcase = 1

"
" CtrlP settings
"
let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

"
" UltiSnips settings
"
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" 
" Airline settings
"
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1

" 
" Vim settings
"
set hidden 		" Allows buffer to be hidden when modified
set number 		" Shows line numbers
set tabstop=4 		" Tab size
set shiftwidth=4 	" Indent size
set softtabstop=4 	" Soft tab size

syntax enable
if has('gui_running')
	set background=dark
	colorscheme solarized
	" set guifont=Monaco\ 12
	set guifont=Inconsolata\ for\ powerline\ 14
	set guioptions-=T 	" Removes the toolbar
endif

" Active folding
set foldmethod=syntax

"
" Keybindings
"
map <F5> :! make<CR>
map <F4> :! make compile<CR>
map <leader>gm <Plug>(Man)
map <F9> :Gstatus<CR>
map <F10> :Gpush<CR>
map <F11> :Gpull<CR>
map <C-h> :A<CR>
map <F2> :NERDTreeToggle<CR>
map /		<Plug>(incsearch-forward)
map ?		<Plug>(incsearch-backward)
map g/		<Plug>(incsearch-stay)
map n		<Plug>(incsearch-nohl-n)
map N		<Plug>(incsearch-nohl-N)
map *		<Plug>(incsearch-nohl-*)
map #		<Plug>(incsearch-nohl-#)
map g*		<Plug>(incsearch-nohl-g*)
map g#		<Plug>(incsearch-nohl-g#)
map z/		<Plug>(incsearch-fuzzy-/)
map z?		<Plug>(incsearch-fuzzy-?)
map zg/		<Plug>(incsearch-fuzzy-stay)

nmap <Leader>w	<Plug>(easymotion-w)
nmap <Leader>b	<Plug>(easymotion-b)
nmap <Leader>e	<Plug>(easymotion-e)
nmap <Leader>j	<Plug>(easymotion-j)
nmap <Leader>k	<Plug>(easymotion-k)
nmap <Leader>s			<Plug>(easymotion-s)
nmap <Leader><S-s>		<Plug>(easymotion-s2)
nmap <Leader>t	:CtrlPBuffer<CR>

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

nnoremap <Space> za
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <F12> :bn<CR>
nnoremap <S-F12> :bp<CR>
