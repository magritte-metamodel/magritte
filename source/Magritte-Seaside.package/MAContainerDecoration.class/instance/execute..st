actions
execute: anObject
	anObject isSymbol
		ifFalse: [ anObject value: self decoratedComponent ]
		ifTrue: [ self decoratedComponent perform: anObject ]