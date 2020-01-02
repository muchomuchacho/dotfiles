set noshowmode
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter

if bufname(bufnr('%')) == '__LanguageClient__'
  setlocal nonumber
  setlocal norelativenumber
endif
