accessing-dynamic
root
	^ self isRoot
		ifTrue: [ self ]
		ifFalse: [ self parent root ]