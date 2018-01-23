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

" Auto comment off
" See http://d.hatena.ne.jp/hyuki/20140122/vim
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" indent
aug Indent
  au!
  au Filetype * setl cindent ts=8 sw=2 sts=2 et
  au Filetype * setl cinoptions=0:,(0                             " for close ):
  au Filetype c,cpp,java,markdown setl cindent ts=8 sw=4 sts=4 et
  au Filetype lisp,scheme setl cindent& ts=8 sw=2 sts=2 et
  au Filetype make setl ts=8 sw=8 sts=8 noet
  au BufRead,BufNewFile *.gradle set filetype=groovy
aug END
