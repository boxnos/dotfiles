" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'w0ng/vim-hybrid'
Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-quickrun'
Plug 'jpalardy/vim-slime'

Plug 'slim-template/vim-slim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
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

" Undo
set undodir=~/.vim/tmp/undo
set undofile

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

" Clipboard
if has('clipboard')
  set clipboard&
  set clipboard^=unnamedplus
endif

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
  autocmd Filetype c,cpp,java,markdown,python setl cindent ts=8 sw=4 sts=4 et
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

" Quickurn
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>

" for pandoc -> LiveReloadX -> chrome
augroup pandoc
  autocmd!
  autocmd Filetype markdown,html,slim
        \ nmap \o :execute "OpenBrowser http://localhost:35729/" . expand("%:r") . ".html"<CR>
augroup END
let g:quickrun_config = {}
let g:quickrun_config.markdown= {
      \ 'type': 'markdown/pandoc',
      \ 'exec' : ['pandoc %s -o %s:p:r.html'],
      \ 'outputter': 'null'
\}
let g:quickrun_config.slim= {
      \ 'command' : 'slimrb',
      \ 'exec' : ['%c -p %s > %s:r.tmp', 'mv %s:r.tmp %s:r.html'],
      \ 'outputter': 'null'
\}
