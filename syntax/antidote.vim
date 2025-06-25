" Antidote plugins syntax file
" See antidote-bundle(1)

" See `b:current_syntax-variable`
if exists("b:current_syntax")
  finish
endif

" See `use-cpo-save`
let s:cpo_save = &cpo
set cpo&vim

syn case match

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn region antidoteBundle start="\v^\s*\zs%(\\\\|\\\s|\S)" skip="\v%(\\\\|\\\s)"
  \ end="\v%(\ze\s|$)" skipwhite nextgroup=antidoteAnnotation
syn region antidoteBundle start='^\s*\zs"' skip='\v%(\\\\|\\")' end='"' oneline
  \ skipwhite nextgroup=antidoteAnnotation
syn region antidoteBundle start="^\s*\zs'" skip="\v%(\\\\|\\')" end="'" oneline
  \ skipwhite nextgroup=antidoteAnnotation

syn match antidoteAnnotation "kind:" contained nextgroup=antidoteKind

syn match antidoteKind "\v%(zsh|fpath|path|clone|defer|autoload)>" contained
  \ skipwhite nextgroup=antidoteAnnotation

syn match antidoteComment "#.*$" contains=@Spell  " See `spell-syntax`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default highlights
hi def link antidoteBundle String
hi def link antidoteAnnotation Type
hi def link antidoteKind Identifier
hi def link antidoteComment Comment

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax = "antidote"

let &cpo = s:cpo_save
unlet s:cpo_save
