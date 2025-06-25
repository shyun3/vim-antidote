" See `ftplugin`
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" See `use-cpo-save`
let s:cpo_save = &cpo
set cpo&vim

" Don't auto-wrap text for non-comments
setlocal formatoptions-=t

" Break comment lines, insert comment leader on new lines, allow formatting of
" comments, don't break long non-comment lines
setlocal formatoptions+=croql

setlocal comments=:#
setlocal commentstring=#\ %s

" See `undo_ftplugin`
let b:undo_ftplugin = "setlocal fo< com< cms<"

let &cpo = s:cpo_save
unlet s:cpo_save
