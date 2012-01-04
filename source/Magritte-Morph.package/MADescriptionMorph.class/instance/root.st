accessing-dynamic
root
	^ self parent isNil
		ifTrue: [ self ]
		ifFalse: [ self parent root ]