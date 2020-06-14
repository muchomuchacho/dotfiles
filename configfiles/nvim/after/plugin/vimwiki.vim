augroup my_notes
  autocmd!
  autocmd BufNewFile *md_notes/diary/*.md :silent 0r !generate-vimwiki-diary-template '%'
  autocmd! BufRead *md_notes/home.md :Git pull
  autocmd BufWritePost *md_notes/* call RunGitCommands()
augroup END

" Add modified files, create a comma separated string with them and use them
" as a commit message.
function! RunGitCommands() abort
  exe 'Git add .'
  let staged_files = join(split(execute("Git status -s"), 'M  '), '')
  let files_str = join(split(staged_files, '\n'), ',')
  exe "Git commit -m 'Update '" . files_str
  exe 'Git push'
  echom 'Changes commited and pushed for ' . files_str
endfunction
