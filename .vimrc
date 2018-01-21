" swap
set directory=~/.vim/tmp
" backup
set backupdir=~/.vim/tmp
" viminfo
set viminfo+=n~/.vim/.viminfo
" history
set history=10000

" commandline-mode behavior {{{
set wildmode=longest,full

cnoremap <C-P> <UP>
cnoremap <C-N> <Down>
cnoremap <Up> <C-P>
cnoremap <Up> <C-N>
" }}}

" status line {{{
set showcmd
set cmdheight=1
set laststatus=2
set wildmenu

" left
" %n buffer number
" %f filename
" encoding-rt
" %y filetype
" %r Readonly flag
" %h Help buffer flag
" %w Preview window flag
" %m Modified flag
" %= Separation point between left and right aligned items.
set statusline=[*%n]\ %f\ %{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}%y%r%h%w%m%=
" right
" %l Line number
" %L Number of lines in buffer
" %< Where to truncate line if too long.
set statusline+=%4l/%4L%<
" }}}
