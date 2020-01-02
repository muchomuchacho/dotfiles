" Like :echoerr, but without the stack trace.
function! muchomuchacho#functions#echoerr(msg) abort
  try
    echohl ErrorMsg
    echomsg a:msg
  finally
    echohl None
  endtry
endfunction

function! muchomuchacho#functions#VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! muchomuchacho#functions#SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

function! muchomuchacho#functions#GrepForWord(cmd) abort
  execute a:cmd expand('<cword>')
endfunction

" Turn on spell-check
function! muchomuchacho#functions#spell() abort
  if has('syntax')
    setlocal spell
    setlocal spellfile=~/.vim/spell/en.utf-8.add
    setlocal spelllang=en,es
  endif
endfunction

" Switch to plaintext
function! muchomuchacho#functions#plaintext() abort
  if has('conceal')
    let b:indentLine_ConcealOptions=1 " Don't let indentLine overwrite
    setlocal concealcursor=nc
  endif
  setlocal nolist
  setlocal textwidth=0
  setlocal wrap
  setlocal wrapmargin=0

  call muchomuchacho#functions#spell()

  noremap <buffer> j gj
  noremap <buffer> k gk

  " Can't restrict `listchars` since it's global
  " and we'd have to save and restore every time
  if has('autocmd')
    autocmd BufWinEnter <buffer> match Error /\s\+$/
    autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
    autocmd InsertLeave <buffer> match Error /\s\+$/
    autocmd BufWinLeave <buffer> call clearmatches()
  endif
endfunction
