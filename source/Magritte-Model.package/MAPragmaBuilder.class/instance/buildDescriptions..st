private
buildDescriptions: anObject
	| descriptionExtensions descriptionSelectors extendedDescriptions |
	
	descriptionSelectors := self uniqueDescriptionSelectors: anObject.
	descriptionExtensions := self descriptionExtensions: anObject.
	
	Halt once.

	extendedDescriptions := descriptionSelectors 
		collect:  [ :descSel |
			| initialDescription |
			initialDescription := anObject perform: descSel.
			self description: initialDescription extendedBy: descriptionExtensions for: descSel of: anObject ].

	^ extendedDescriptions select: #notNil.