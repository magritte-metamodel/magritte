private
buildDescriptions: anObject
	| descriptionExtensions descriptionSelectors |
	
	descriptionSelectors := self uniqueDescriptionSelectors: anObject.
	descriptionExtensions := self descriptionExtensions: anObject.

	^ (descriptionSelectors 
		collect:  [ :each |
			| description |
			description := anObject perform: each.
			
			description notNil ifTrue: [
				descriptionExtensions at: each ifPresent: [ :extensions | 
					extensions do: [ :extensionSelector | 
						description := anObject perform: extensionSelector with: description ] ] ].
			description ])
		select: #notNil.