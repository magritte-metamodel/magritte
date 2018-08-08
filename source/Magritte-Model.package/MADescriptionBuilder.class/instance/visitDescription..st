visiting
visitDescription: anObject
	builtDescription
		ifNil: [ self setBuiltDescription: anObject]
		ifNotNil: [ builtDescription add: anObject ]