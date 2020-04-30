if exists('g:loaded_todo')
  finish
endif
let g:loaded_todo = 1

if !exists('g:todo_states')
  let g:todo_states = [' ', 'x']
endif

function! s:MakeBox(line) abort
  if matchstr(a:line, '\[.\]') == ""
    let mod_line = substitute(a:line, '\<', ' ' . '[' . 'x' . ']' . ' ' . 'TODO: ', '')
    return mod_line
  else
    return a:line
  endif
endfunction

function! todo#ToggleComplete() abort
  let states = copy(g:todo_states)
  let l:line = s:MakeBox(getline('.'))
  let view = winsaveview()
  let l:char = matchstr(l:line, '\[\zs.\ze]')
  let l:char = states[(index(states, l:char) + 1) % len(states)]
  if l:char == g:todo_states[-1]
    let l:line = substitute(l:line, 'TODO', 'DONE', '')
  else
    let l:line = substitute(l:line, 'DONE', 'TODO', '')
  endif
  keeppatterns call setline(line('.'), substitute(l:line, '\[\zs.\ze]', l:char, ''))
  call winrestview(view)
  silent update
endfunction

command! TodoToggle call todo#ToggleComplete()


function! OpenTodo() abort
  let name = 'PROJECT.td'
  if !filereadable(l:name)
    let l:file = fnamemodify(l:name, ':p')
  endif
  execute "pedit " . name
  execute 'wincmd j'
  if &previewwindow
    setlocal norelativenumber nonumber nobuflisted noswapfile
  endif
endfunction

command! TodoBrowser call OpenTodo()
