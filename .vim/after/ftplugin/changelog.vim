function! s:first_line(string)
  return substitute(a:string, '\n.*$', "", "")
endfunction

let g:changelog_username = s:first_line(system('whoami'))

" Fix cursor position when "%c$"
if (match(g:changelog_new_entry_format, "%c$") != -1)
  nnoremap <buffer> <silent> <Leader>o :<C-u>NewChangelogEntry<CR><C-c>A
  xnoremap <buffer> <silent> <Leader>o :<C-u>NewChangelogEntry<CR><C-c>A
endif
