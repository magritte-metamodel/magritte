actions
execute: anObject
	anObject isSymbol
		ifFalse: [ anObject cull: self decoratedComponent ]
		ifTrue: [ self decoratedComponent perform: anObject ]