initialization
finalize
	|  dir |
	dir := self directory.
	dir exists
		ifTrue: [ dir deleteAll ].
	[ (dir := dir parent) hasChildren ]
		whileFalse: [ dir ensureDeleted ].
	super finalize.
	location := nil