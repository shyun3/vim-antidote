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

syn match antidoteComment "#.*$" contains=@Spell  " See `spell-syntax`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default highlights
hi def link antidoteComment Comment

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax = "antidote"

let &cpo = s:cpo_save
unlet s:cpo_save
