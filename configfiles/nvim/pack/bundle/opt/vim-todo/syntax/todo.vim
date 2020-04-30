if exists("b:current_syntax")
  finish
endif

syntax region todoChecks matchgroup=todoBox start=+\[+ skip=+*+ end=+\]+ contains=todoOperator
syntax keyword todoKeyword TODO
syntax keyword doneKeyword DONE

syntax match todoOperator "\v\*"
syntax match todoOperator "\v-"

syntax match todoComment "\v#.*$"

highlight link todoComment Identifier

highlight todoBox ctermfg=green guifg=green
highlight link todoChecks String
highlight link todoOperator Label
highlight link doneKeyword String
highlight link todoKeyword Label

let b:current_syntax = "todo"
