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

function! s:FindGitRoot(file) abort
  let l:path = fnamemodify(a:file, ':p')
  while 1
    let l:path = fnamemodify(l:path, ':h')
    let l:candidate = l:path . '/.git'
    if isdirectory(l:candidate)
      return fnamemodify(l:candidate, ':h:t')
    endif
    if l:path == '' || l:path == '/'
      return ''
    endif
  endwhile
endfunction

function! todo#ToggleComplete() abort
  if !&previewwindow
    echo 'This is not a TODO window!'
    return
  endif
  let states = copy(g:todo_states)
  let td = {'t': 'TODO', 'd': 'DONE'}
  let l:line = s:MakeBox(getline('.'))
  let view = winsaveview()
  let l:char = matchstr(l:line, '\[\zs.\ze]')
  let l:char = states[(index(states, l:char) + 1) % len(states)]
  if l:char == g:todo_states[-1]
    let l:line = substitute(l:line, td.t, td.d, '')
  else
    let l:line = substitute(l:line, td.d, td.t, '')
  endif
  keeppatterns call setline(line('.'), substitute(l:line, '\[\zs.\ze]', l:char, ''))
  call winrestview(view)
  silent update
endfunction

command! TodoToggle call todo#ToggleComplete()

function! OpenTodo() abort
  let l:proj_dir = s:FindGitRoot('.')
  if l:proj_dir == ""
    let l:f_name = 'PROJECT.td'
    let l:proj_dir = fnamemodify(l:f_name, ':r')
  else
    let l:f_name = l:proj_dir . '.td'
  endif
  " if !filereadable(l:f_name)
  "   let l:file = fnamemodify(l:f_name, ':p')
  " endif
  execute "pedit " . l:f_name
  execute 'wincmd j'
  let l:first_text = getline(2)
  if matchstr(l:first_text, '#', 0) == ""
    call append(0, ["", "# TODO for " . l:proj_dir, ""])
    silent update
  endif
  if &previewwindow
    setlocal norelativenumber nonumber nobuflisted noswapfile
  endif
endfunction

command! TodoBrowser call OpenTodo()
