" Antidote plugins syntax file
" See antidote-bundle(1)

" See `b:current_syntax-variable`
if exists("b:current_syntax")
  finish
endif

" See `use-cpo-save`
let s:cpo_save = &cpo
set cpo&vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn case match

syn match antidoteBundle "\v^\s*\zs%(\\\\|\\\s|\S)+" skipwhite
  \ nextgroup=antidoteAnnotation
syn region antidoteBundle start='^\s*\zs"' skip='\v%(\\\\|\\")' end='"'
  \ skipwhite nextgroup=antidoteAnnotation
syn region antidoteBundle start="^\s*\zs'" skip="\v%(\\\\|\\')" end="'"
  \ skipwhite nextgroup=antidoteAnnotation

syn match antidoteAnnotation "kind:" contained nextgroup=antidoteKind
syn match antidoteAnnotation "branch:" contained nextgroup=antidoteBranch
syn match antidoteAnnotation "\v%(path|autoload):" contained
  \ nextgroup=antidotePath
syn match antidoteAnnotation "\v%(conditional|pre|post):" contained
  \ nextgroup=antidoteFunction

syn match antidoteKind "\v%(zsh|fpath|path|clone|defer|autoload)>" contained
  \ skipwhite nextgroup=antidoteAnnotation

" Git branch names are a bit stricter than this
syn match antidoteBranch "[a-zA-Z0-9._/-]+" contained skipwhite
  \ nextgroup=antidoteAnnotation

syn match antidotePath "\v%(\\\\|\\\s|\S)+" contained skipwhite
  \ nextgroup=antidoteAnnotation
syn region antidotePath start='"' skip='\v%(\\\\|\\")' end='"'
  \ contained skipwhite nextgroup=antidoteAnnotation
syn region antidotePath start="'" skip="\v%(\\\\|\\')" end="'"
  \ contained skipwhite nextgroup=antidoteAnnotation

" Sensible zsh function name
syn match antidoteFunction "[a-zA-Z_][a-zA-Z0-9_-]*" contained skipwhite
  \ nextgroup=antidoteAnnotation

syn match antidoteComment "#.*$" contains=@Spell  " See `spell-syntax`

syn sync minlines=50

hi def link antidoteBundle Statement
hi def link antidoteAnnotation Type
hi def link antidoteKind Identifier
hi def link antidotePath String
hi def link antidoteFunction Function
hi def link antidoteComment Comment

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax = "antidote"

let &cpo = s:cpo_save
unlet s:cpo_save
