initialization
finalize
	| directory |
	directory := self directory.
	directory exists
		ifTrue: [ directory delete ].
	[ (directory := directory parent) hasChildren ]
		whileTrue: [ directory delete ].
	super finalize.
	location := nil