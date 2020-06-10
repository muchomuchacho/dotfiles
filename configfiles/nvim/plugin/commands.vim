command! -nargs=* -complete=file Find call muchomuchacho#commands#find(<q-args>)

command! -nargs=* -complete=file -range OpenOnGitHub <line1>,<line2>call muchomuchacho#commands#open_on_github(<f-args>)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number --color=always '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Apply fzf#vim#grep to use ripgrep:
command! -bang -nargs=* Rgw
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

command! -bang -nargs=* Rtags
  \ call fzf#vim#tags(
  \   expand('<cword>'),
  \   <bang>0)

command! -bang -nargs=* Rgf
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:n_search_paths = ['~/Seafile/logbook/Notes', '~/Seafile/logbook/MD_wiki']
let s:search_paths = map(copy(g:n_search_paths), 'expand(v:val)')
let s:search_path_str = join(map(copy(s:search_paths), 'shellescape(v:val)'))

command! -bang Bck
    \ call muchomuchacho#commands#RipgrepFzf('\[\['.expand('%:t:r').'\]\]', s:search_path_str)

command! -bang -nargs=1 Rwiki
    \ call muchomuchacho#commands#RipgrepFzf(<q-args>, s:search_path_str)

