*Magritte-Merging
is: newValue anInterestingReplacementFor: oldValue
	newValue isNil ifTrue: [ ^ false ].
	oldValue = newValue ifTrue: [ ^ false ].
	^ true