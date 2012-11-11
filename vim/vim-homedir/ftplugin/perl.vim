" 4 space tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" *.t files are Perl test scripts
"autocmd BufNewFile,BufRead *.t compiler perltest

" TT template files are in Mason mode for syntax highlighting
autocmd BufNewFile,BufRead *.tt set ft=mason 

" show matching brackets
set showmatch

" line width is 80
set textwidth=80

" highlight lines with more than 80 chars
match ErrorMsg /\%>80v.\+/

" show line numbers
set number

" check perl code with :make
set makeprg=perl\ -Ilib\ -c\ %\ $*
set errorformat=%f:%l:%m

" write the content of the buffer when necessary
set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" pc: perl compile test on current file
map pc :!perl -Ilib -cw %<cr>

" pr: perl run the current file
map pr :!perl -Ilib %<cr>

" pt: prove the the current test 
map pt :!prove -vl %<cr>

" ct : ctags are updated with lib and t/lib
map ct :!ctags -R lib t/lib<cr>
