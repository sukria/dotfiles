" line width is 80
autocmd FileType ruby set textwidth=80

" Ruby's indentation is 2 spaces
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" F10 : enter the test directory and run the current script 
autocmd FileType ruby map <F10> :!cd test && ruby ../%<CR>

" .erb files are most of the time ERB html views
autocmd BufNewFile,BufRead *.erb set ft=html.erb
