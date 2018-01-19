" swap
set directory=~/.vim/tmp
" backup
set backupdir=~/.vim/tmp
" viminfo
set viminfo+=n~/.vim/.viminfo
" history
set history=10000

" commandline-mode behavior
set wildmode=longest,full

cnoremap <C-P> <UP>
cnoremap <C-N> <Down>
cnoremap <Up> <C-P>
cnoremap <Up> <C-N>
