" VimWiki

let g:n_search_paths = ['~/Seafile/logbook/Notes', '~/Seafile/logbook/MD_wiki']
let s:search_paths = map(copy(g:n_search_paths), 'expand(v:val)')
let s:search_path_str = join(map(copy(s:search_paths), 'shellescape(v:val)'))

" set path to a directory inside Seafile
let my_notes = {}
let my_notes.path = g:n_search_paths[0]
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

" Markdown wiki for testing
let md_wiki = {}
let md_wiki.path = g:n_search_paths[1]
let md_wiki.path_html = '~/Seafile/logbook/MD_html'
let md_wiki.auto_tags = 1
let md_wiki.auto_generate_tags = 1
let md_wiki.auto_generate_links = 1
let md_wiki.auto_diary_index = 1
let md_wiki.automatic_nested_syntaxes = 1
let md_wiki.auto_toc = 1
let md_wiki.syntax = 'markdown'
let md_wiki.ext = '.md'

let g:vimwiki_list = [md_wiki, my_notes]
" make sure vimwiki doesn't own all .md files
let g:vimwiki_global_ext = 0
" let g:vimwiki_ext = '.md'
" use colors in header highlighting
let g:vimwiki_hl_headers = 1

let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

augroup my_notes
  autocmd!
  autocmd BufNewFile *MD_wiki/diary/*.md :silent 0r !generate-vimwiki-diary-template '%'
augroup END

command! -bang Bck
    \ call muchomuchacho#commands#RipgrepFzf('\[.*?\]\('.expand('%:t:r').'.*?\)', s:search_path_str)

command! -bang -nargs=1 Rwiki
    \ call muchomuchacho#commands#RipgrepFzf(<q-args>, s:search_path_str)
