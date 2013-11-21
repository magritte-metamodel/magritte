initialization
finalize
	| directory |
	directory := self directory.
	directory exists
		ifTrue: [ directory deleteAll ].
	[ (directory := directory parent) hasChildren ]
		whileFalse: [ directory ensureDelete ].
	super finalize.
	location := nil