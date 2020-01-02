function! s:require(condition, message)
  if a:condition
    call health#report_ok(a:message)
  else
    call health#report_error(a:message)
  endif
endfunction

function! health#muchomuchacho#check() abort
  call health#report_start('muchomuchacho')
  call s:require(has('python'), 'Has Python support')
endfunction
