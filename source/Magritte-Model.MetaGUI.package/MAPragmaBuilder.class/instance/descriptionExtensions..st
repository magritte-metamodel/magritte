private
descriptionExtensions: anObject
	| extensionPragmas |
	
	extensionPragmas := Pragma
		allNamed: self class magritteDescriptionExtensionPragma
		from: anObject class to: Object.
	
	^ extensionPragmas inject: Dictionary new into: [ :extensionSelectors :each | 
		| extensionSelectorTarget |
		extensionSelectorTarget := each arguments first.
		(extensionSelectors at: extensionSelectorTarget ifAbsentPut: [ SortedCollection new ]) add: each method selector.
		extensionSelectors ].
