
" Ruby's indentation is 2 spaces
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" F10 : enter the test directory and run the current script 
map <F10> :!cd test && ruby ../%<CR>
