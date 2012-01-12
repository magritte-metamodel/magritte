private
descriptionExtensions: anObject
	| extensionPragmas extensionSelectors  |
	
	extensionPragmas := Pragma
		allNamed: self class descriptionExtensionPragma
		from: anObject class to: Object.
		
	extensionSelectors := Dictionary new.
	extensionPragmas do: [ :each | 
		| extensionSelectorTarget |
		extensionSelectorTarget := each arguments first.
		(extensionSelectors at: extensionSelectorTarget ifAbsentPut: [ SortedCollection new ]) add: each method selector ].
	
	^ extensionSelectors