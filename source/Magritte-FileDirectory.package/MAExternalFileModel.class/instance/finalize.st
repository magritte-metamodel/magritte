initialization
finalize
	| directory |
	directory := self directory.
	directory exists
		ifTrue: [ directory recursiveDelete ].
	[ (directory := directory containingDirectory) entries isEmpty ]
		whileTrue: [ directory recursiveDelete ].
	super finalize.
	location := nil