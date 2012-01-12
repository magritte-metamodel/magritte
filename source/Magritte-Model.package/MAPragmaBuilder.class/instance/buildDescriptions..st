private
buildDescriptions: anObject
	| descriptionPragmas extensionPragmas extensionSelectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class descriptionPragma 
		from: anObject class to: Object.
		
	extensionPragmas := Pragma
		allNamed: self class descriptionExtensionPragma
		from: anObject class to: Object.
		
	extensionSelectors := Dictionary new.
	extensionPragmas do: [ :each | 
		| extensionSelectorTarget |
		extensionSelectorTarget := each arguments first.
		(extensionSelectors at: extensionSelectorTarget ifAbsentPut: [ SortedCollection new ]) add: each method selector ].
	
	^ descriptionPragmas 
		collect: [ :each |
			| selector description |
			selector := each method selector.
			description := anObject perform: selector.
			
			description notNil ifTrue: [
				extensionSelectors at: selector ifPresent: [ :extensions | 
					extensions do: [ :extensionSelector | 
						description := anObject perform: extensionSelector with: description ] ] ].
			
			description	]
		thenSelect: #notNil