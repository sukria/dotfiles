" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

" *.t files are Perl test scripts
autocmd BufNewFile,BufRead *.t set ft=perl 
"autocmd BufNewFile,BufRead *.t compiler perltest

" show matching brackets
autocmd FileType perl set showmatch

" line width is 80
autocmd FileType perl set textwidth=80

" show line numbers
autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -Ilib\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m

" write the content of the buffer when necessary
autocmd FileType perl set autowrite

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F2>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>


" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" map a runner key
autocmd FileType perl map <F7> :!perlcritic --profile .perlcriticrc %<cr>
autocmd FileType perl map <F8> :!prove -vl %<cr>
" F9 is already a binding to :make (see common.vim)
autocmd FileType perl map <F10> :!~/bin/update_cover.sh<cr>

