initialization
finalize
	|  dir |
	dir := self directory.
	dir exists
		ifTrue: [ dir deleteAll ].
	[ (dir := dir parent) hasChildren ]
		whileFalse: [ dir ensureDelete ].
	super finalize.
	location := nil