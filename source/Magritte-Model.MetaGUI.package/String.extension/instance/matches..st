*magritte-model-testing
matches: aString
	aString isEmpty ifTrue: [ ^ true ].
	^ (aString includesAnyOf: '*#')
		ifTrue: [ aString match: self ]
		ifFalse: [ self includesSubstring: aString caseSensitive: false ]