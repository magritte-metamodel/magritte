private
build: anObject for: aSelector in: aCollection
	^ (aCollection select: [ :each | each isDescriptionExtension: aSelector ])
		inject: (anObject perform: aSelector)
		into: [ :result :each | 
			result isNil 
				ifFalse: [ anObject perform: each with: result ] ]