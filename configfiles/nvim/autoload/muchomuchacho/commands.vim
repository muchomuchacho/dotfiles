function! muchomuchacho#commands#find(args) abort
    set errorformat+=%f

    cexpr system('find ' . a:args)
endfunction

" Map of .git directories to GitHub user-or-org/project identifiers.
let s:directories = {}

function! s:open_on_github(file, range) abort
  let l:git_dir=muchomuchacho#git#get_git_dir(a:file)
  if l:git_dir == ''
    call muchomuchacho#functions#echoerr('No .git directory found above ' . a:file)
    return
  endif

  let l:key=l:git_dir
  if !has_key(s:directories, l:key)
    let s:directories[l:key]=-1

    try
      let l:remotes=system('git --git-dir=' . shellescape(l:git_dir) . ' remote -v')
      " Look for lines like these:
      "
      "   remote-a git@github.com:user-or-org/repo.git (...)
      "   remote-b https://github.com/user-or-org/repo.git (...)
      "
      for l:remote in ['github', 'upstream', 'upstream-rw', 'origin']
        let l:match=matchlist(
              \   l:remotes,
              \   '\(^\|\n\)' .
              \       l:remote .
              \       '\s\+\(git@github\.com:\|https://github\.com/\)\(\S\{-}\)\(\.git\)\?\s'
              \ )
        if len(l:match)
          let s:directories[l:key]=l:match[3]
          break
        endif
      endfor
    catch
      " Cool, cool...
    endtry
  endif

  let l:address=s:directories[l:key]

  if l:address != -1
    let l:root=fnamemodify(l:git_dir, ':h')
    let l:relative_path=strcharpart(a:file, strchars(l:root))
    let l:url=shellescape('https://github.com/' . l:address . '/tree/master' . l:relative_path . a:range)
    call system('open ' . l:url)
  endif
endfunction

function! muchomuchacho#commands#open_on_github(...) abort range
  let l:range=''
  if a:0 == 0
    let l:files=[expand('%')]

    " Note: line numbers may not be accurate because we always open the HEAD of
    " the master branch.
    if visualmode() != ''
      if a:firstline == a:lastline
        let l:range='#L' . a:firstline
      else
        let l:range='#L' . a:firstline . '-L' . a:lastline
      endif
    endif
  else
    let l:files=a:000
  endif
  let l:did_open=0
  for l:file in l:files
    let l:file=fnamemodify(l:file, ':p')
    if l:file !=# ''
      call s:open_on_github(l:file, l:range)
      let l:did_open=1
    endif
  endfor
  if !l:did_open
    call muchomuchacho#functions#echoerr('No filename')
  endif
endfunction
