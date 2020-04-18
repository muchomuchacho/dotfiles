"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    function! s:MuchoAutocmds()
        augroup MuchoAutocmds
            autocmd!

            " Disable paste mode when leaving insert mode
            autocmd InsertLeave * set nopaste

            " Enable spellcheck for plaintext files
            autocmd FileType plaintext setlocal spell spelllang=en_gb

            " Get correct comment highlighting for json
            autocmd FileType json syntax match Comment +\/\/.\+$+

            " " Help filetype detection
            " autocmd BufRead *.plot set filetype=gnuplot
            " autocmd BufRead *.md set filetype=markdown
            " autocmd BufRead *.lds set filetype=ld
            " autocmd BufRead *.tex set filetype=tex
            " autocmd BufRead *.trm set filetype=c
            " autocmd BufRead *.xlsx.axlsx set filetype=ruby

            if has('folding')
              " Like the autocmd described in `:h last-position-jump` but we add `:foldopen!`.
              autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | execute 'silent! ' . line("'\"") . 'foldopen!' | endif
            else
              autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | endif
              " autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
            endif

        augroup END
    endfunction

    call s:MuchoAutocmds()

    " Wait until idle to run additional "boot" commands.
    augroup MuchoIdleboot
        autocmd!
        if has('vim_starting')
            autocmd CursorHold,CursorHoldI * call muchomuchacho#autocmds#idleboot()
        endif
    augroup END

endif
