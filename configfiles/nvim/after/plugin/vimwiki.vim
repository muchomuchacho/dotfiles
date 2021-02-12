augroup md_wiki
  autocmd!
  autocmd BufNewFile *md_wiki/diary/*.md :silent 0r !generate-vimwiki-diary-template '%'
  autocmd BufRead,BufNewFile *md_wiki/diary/*.md call AppendToDo()
  autocmd BufWritePre,FileWritePre *md_wiki/diary/*.md call FeedBackToDoChanges()
  autocmd BufRead *md_wiki/home.md :Git pull
  autocmd BufRead *md_wiki/home.md call AddLinkToReading()
  autocmd BufWritePost *md_wiki/* call RunGitCommands()
augroup END

" Add modified files, create a comma separated string with them and use them
" as a commit message.
function! RunGitCommands() abort
  let choice = confirm("Commit and push changes?", "&Yes\n&No\n&Cancel", 3)
  if choice == 2
    echo "Exiting without committing changes!"
    return
  elseif choice == 1
    exe 'Git add .'
    let staged_files = join(split(execute("Git status -s"), '[MA]  '), '')
    let files_str = join(split(staged_files, '\n'), ',')
    if empty(files_str) == 1
      echo "No modified files to commit."
      return
    endif
    exe "Git commit -m 'Update '" . files_str
    exe 'Git push'
    echom 'Changes commited and pushed for ' . files_str
  endif
endfunction

" Add link to Reading after line
function! AddLinkToReading() abort
  let mark_line =  search('\[Reading\]')
  if mark_line
    call deletebufline(bufnr("%"), mark_line)
  endif
  let w = search('### Active')
  exec w . "pu='* [Reading](/diary/'.strftime('%Y-%m-%d').'#Reading)'"
  silent update
endfunction

function! AppendToDo() abort
  let curr_file = "/diary/".strftime('%Y-%m-%d').".md"
  let mark_1 = search('## ToDo')
  let mark_2 = search('## Input')
  if mark_1
    call deletebufline(bufnr("%"), mark_1, mark_2 - 1)
  endif
  let fl = readfile("ToDo.md", "b")
  call appendbufline("/diary/".strftime('%Y-%m-%d').".md", 22, fl)
endfunction

function! FeedBackToDoChanges() abort
  let mark_1 = search('## ToDo')
  let mark_2 = search('## Input')
  let text = getbufline("/diary/".strftime('%Y-%m-%d').".md", mark_1, mark_2 - 1)
  call writefile(text, "ToDo.md", "b")
endfunction
