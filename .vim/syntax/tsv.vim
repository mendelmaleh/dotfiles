if exists("b:current_syntax")
	finish
endif

syn match tsvComment "^-.*"
hi def link tsvComment Comment

let b:current_syntax = "tsv"
