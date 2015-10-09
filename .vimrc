set clipboard=unnamed
set wildmenu
set hidden

" Automatically load plugins
execute pathogen#infect()
filetype plugin indent on


" Force jedi-vim to python 2
let g:jedi#force_py_version=2
" let g:jedi#completions_command = "<C-space"
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command           = "<leader>n"
let g:jedi#rename_command           = "<leader>r"
let g:jedi#show_call_signatures = "1"

" set tabs to have 4 spaces
" enable syntax highlighting
syntax on

" show line numbers 
set number

" set tabs to have 4 spaces
set ts=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for {} and []
set showmatch 

" enable all python syntax highlighting features
let python_highlight_all = 1

" enable <enter> to create new line in insert mode
nmap <S-Enter> O <Esc>
nmap <CR> o<Esc>
nmap <F7> :tabp <Enter>
nmap <F8> :tabn <Enter>
