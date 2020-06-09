" Leader mappings

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>

" <Leader>q -- Delete buffer.
nnoremap <silent> <leader>q :bd<Cr>

nnoremap <leader>o :only<Cr>

" Open Vimrc in a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Reload the Vimrc file after making changes
nnoremap <leader>sv :source $MYVIMRC<cr>

" Show the path of the current file
nnoremap <Leader>p :echo expand('%')<CR>

" Quickly open a markdown buffer for scribble
" map <leader>l :vs ~/Seafile/logbook/logbook.md<cr>

" coc-todolist
" nnoremap <leader>tt :CocList todolist<cr>

" TODO plugin
nnoremap <silent> <leader>tt :TodoBrowser<cr>
nnoremap <silent> <leader>m :TodoToggle<CR>

nnoremap <leader>ss :VimwikiSearchTags<space>
nnoremap <silent><leader>l :VimwikiBacklinks<CR>
nnoremap <silent><leader>gh :VimwikiAll2HTML<CR>

" FZF
nnoremap <silent> <leader>b :Buffers<Cr>
nnoremap <silent> <leader>t :GGrep<Cr>
nnoremap <silent> <Leader>d :GFiles<Cr>
nnoremap <silent> <Leader>wt :Rtags<CR>
" nnoremap <silent> <Leader>t :Tags<Cr>
nnoremap <silent> <Leader>cc :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
nnoremap <localleader> w :call muchomuchacho#functions#GrepForWord("Rgw")<CR>
nnoremap <leader> ] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
" noremap <leader>p :read !xsel --clipboard --output<cr>
" noremap <leader>c :w !xsel -ib<cr><cr>

" <LocalLeader>d... -- Diff mode bindings:
" - <LocalLeader>dd: show diff view (mnemonic: [d]iff)
" - <LocalLeader>dh: choose hunk from left (mnemonic: [h] = left)
" - <LocalLeader>dl: choose hunk from right (mnemonic: [l] = right)
nnoremap <silent> <LocalLeader>ds :Git<CR>
nnoremap <silent> <LocalLeader>dd :Gvdiff<CR>
nnoremap <silent> <LocalLeader>dh :diffget //2<CR>
nnoremap <silent> <LocalLeader>dl :diffget //3<CR>

" <LocalLeader>e -- Edit file, starting in same directory as current file.
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
