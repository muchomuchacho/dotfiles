function! GetMPCStatusline()
  let cmd = "mpc status"
  let result = split(system(cmd), '\n')

  let status = len(result) == 3 ? result[2] : result[0]

  let [s:count, s:settings] = [len(split(system('mpc playlist'), '\n')),
    \ split(status, '   ')]

  let s:statusline = " "
    \ . s:settings[1] . " --- "
    \ . s:settings[2] . " ---%="
    \ . s:count . " songs "

  return s:statusline
endfunction

set buftype=nofile
setlocal statusline=%!GetMPCStatusline()

setlocal conceallevel=3
setlocal concealcursor=nvic

command! -buffer PlaySlectedSong call mpc#PlaySong(line("."))
command! -buffer ToggleRandom    call mpc#ToggleRandom()
command! -buffer ToggleRepeat    call mpc#ToggleRepeat()

nnoremap <silent>          <plug>MpcToggleplayback  :TogglePlayback<cr>
nnoremap <silent> <buffer> <c-x>                    :PlaySlectedSong<cr>
nnoremap <silent> <buffer> <c-a>                    :ToggleRandom<cr>
nnoremap <silent> <buffer> <c-e>                    :ToggleRepeat<cr>

if !hasmapto("<plug>MpcToggleplayback")
  nmap <leader>k  <plug>MpcToggleplayback
endif
