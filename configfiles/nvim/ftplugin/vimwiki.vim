let s:search_paths = map(copy(g:n_search_paths), 'expand(v:val)')
let s:search_path_str = join(map(copy(s:search_paths), 'shellescape(v:val)'))

command! -bang Bck
    \ call muchomuchacho#commands#RipgrepFzf('\[.*?\]\(/?'.expand('%:t:r').'.*?\)', s:search_path_str)

command! -bang -nargs=1 GrepWiki
    \ call muchomuchacho#commands#RipgrepFzf(<q-args>, s:search_path_str)
