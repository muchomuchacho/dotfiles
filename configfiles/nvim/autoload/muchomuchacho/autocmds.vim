function! muchomuchacho#autocmds#idleboot() abort
  " Make sure we automatically call muchomuchacho#autocmds#idleboot() only once.
  augroup MuchoIdleboot
    autocmd!
  augroup END

  " Make sure we run deferred tasks exactly once.
  doautocmd User MuchoDefer
  autocmd! User MuchoDefer
endfunction
