" VimWiki
" set path to a directory inside Seafile
let my_notes = {}
let my_notes.path = '~/Seafile/logbook/Notes/'
let my_notes.path_html = '~/Seafile/logbook/Notes_html/'
let my_notes.template_path = '~/Seafile/logbook/templates/'
let my_notes.template_default = 'def_template'
let my_notes.template_ext = '.html'
let my_notes.auto_generate_links = 1
let my_notes.auto_generate_tags = 1
let my_notes.auto_diary_index = 1
let my_notes.auto_toc = 1
let my_notes.automatic_nested_syntaxes = 1
let my_notes.auto_tags = 1
let my_notes.ext = '.md'

let g:vimwiki_list = [my_notes]
" make sure vimwiki doesn't own all .md files
let g:vimwiki_global_ext = 0
let g:vimwiki_ext = '.md'
" use colors in header highlighting
let g:vimwiki_hl_headers = 1

let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

augroup my_notes
  autocmd!
  autocmd BufNewFile *Notes/diary/*.md :silent 0r !generate-vimwiki-diary-template '%'
augroup END
