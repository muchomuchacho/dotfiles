command! -bang Bck
    \ call muchomuchacho#commands#RipgrepFzf('\[.*?\]\('.expand('%:t:r').'.*?\)', s:search_path_str)

command! -bang -nargs=1 GrepWiki
    \ call muchomuchacho#commands#RipgrepFzf(<q-args>, s:search_path_str)
