initialization
finalize
	| directory |
	directory := self directory.
	directory exists
		ifTrue: [ directory deleteAll ].
	[ (directory := directory parent) hasChildren ]
		whileFalse: [ directory ensureDeleted ].
	super finalize.
	location := nil