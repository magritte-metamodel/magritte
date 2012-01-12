private
uniqueDescriptionSelectors: anObject
	| descriptionPragmas uniqueSelectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class descriptionPragma 
		from: anObject class to: Object.
	
	uniqueSelectors := Set new.
	
	^ descriptionPragmas 
		select: [ :each |
			(uniqueSelectors includes: each method selector) 
				ifTrue: [ false ]
				ifFalse: [ uniqueSelectors add: each method selector. true ] ]
		thenCollect:  [ :each |
			each method selector ]