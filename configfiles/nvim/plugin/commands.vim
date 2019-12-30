command! -nargs=* -complete=file Find call muchomuchacho#commands#find(<q-args>)

command! -nargs=* -complete=file -range OpenOnGitHub <line1>,<line2>call muchomuchacho#commands#open_on_github(<f-args>)
