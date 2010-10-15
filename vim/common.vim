set nu
" use visual bell instead of beeping
set vb

" incremental search
set incsearch

" syntax highlighting
set bg=light
syntax on

" auto-indent
set autoindent
set smartindent

" F9 is the make key
map <F9> :make<CR>

" default tabulation rules
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Tip #80
" open files to the previous line number  
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" vtreeExplorer options
let treeExplVertical=1
let treeExplWinSize=25
let treeExplNoList=1

set mouse=a

