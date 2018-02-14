" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'w0ng/vim-hybrid'
Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-quickrun'
Plug 'jpalardy/vim-slime'
call plug#end()

" Directory Settings
" swap
set directory=~/.vim/tmp
" backup
set backupdir=~/.vim/tmp
" viminfo
set viminfo&
set viminfo+=n~/.vim/tmp/.viminfo

" Buffer
set hidden
set confirm

" History
set history=10000

" Commandline mode behavior {{{
set wildmode=longest,full

cnoremap <C-P> <UP>
cnoremap <C-N> <Down>
cnoremap <Up> <C-P>
cnoremap <Up> <C-N>
" }}}

" Key behavior
set notimeout
set ttimeout
set timeoutlen=200

" Line Numbers
set number

" Status line {{{
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

" Indent
augroup Indent
  autocmd!
  autocmd Filetype * setl cindent ts=8 sw=2 sts=2 et
  autocmd Filetype * setl cinoptions=0:,(0                             " for close ):
  autocmd Filetype c,cpp,java,markdown setl cindent ts=8 sw=4 sts=4 et
  autocmd Filetype lisp,scheme setl cindent& ts=8 sw=2 sts=2 et
  autocmd Filetype changelog setl ts=8 sw=8 sts=8 noet nomodeline
  autocmd Filetype make setl ts=8 sw=8 sts=8 noet
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
augroup END

" Color
set t_Co=256
syntax enable
set listchars=tab:>-,eol:<
set list
let g:lisp_rainbow = 1

colorscheme hybrid
highlight MatchParen ctermfg=lightgray  ctermbg=black

" Quickfix
function! s:Open_quickfix_window()
  for e in filter(getqflist(), 'v:val.valid != 0')
    copen
    return
  endfor
  cclose
endfunction

augroup QuickFix
  autocmd!
  autocmd QuickfixCmdPost *grep*,make call s:Open_quickfix_window()
augroup END

set errorformat&
let &errorformat = 'make:%.%#%[%f:%l:%m,' . &errorformat " for make (MAKESHIFT)

" Slim-vim
let g:slime_target = "vimterminal"

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

let g:quickrun_config = {}
let g:quickrun_config.mob= {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s -f markdown',
      \ 'outputter': 'browser'
\}
