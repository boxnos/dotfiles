function! s:first_line(string)
  return substitute(a:string, '\n.*$', "", "")
endfunction

let g:changelog_username = s:first_line(system('whoami'))
