"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    function! s:MuchoAutocmds()
        augroup MuchoAutocmds
            autocmd!

            " Disable paste mode when leaving insert mode
            autocmd InsertLeave * set nopaste

            " Jump to last edit position on opening file
            " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
            au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

            " Help filetype detection
            autocmd BufRead *.plot set filetype=gnuplot
            autocmd BufRead *.md set filetype=markdown
            autocmd BufRead *.lds set filetype=ld
            autocmd BufRead *.tex set filetype=tex
            autocmd BufRead *.trm set filetype=c
            autocmd BufRead *.xlsx.axlsx set filetype=ruby
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
