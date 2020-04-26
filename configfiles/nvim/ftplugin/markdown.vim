" set noshowmode
" let g:sneak#s_next = 1
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_auto_insert_bullets = 0
" let g:vim_markdown_frontmatter = 1
" set printfont=:h10
" set printencoding=utf-8
" set printoptions=paper:letter

" if bufname(bufnr('%')) == '__LanguageClient__'
"   setlocal nonumber
"   setlocal norelativenumber
" endif

" no folds
let g:vim_markdown_folding_disabled = 1
" shrink toc if possible
let g:vim_markdown_toc_autofit = 1
" fancy syntax concealment
autocmd FileType markdown set conceallevel=2
" but not for code blocks
let g:vim_markdown_conceal_code_blocks = 0
" yaml frontmatter
let g:vim_markdown_frontmatter = 1
