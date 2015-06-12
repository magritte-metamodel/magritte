enumerating
union: aContainer
	^ self copy
		addAll: (aContainer reject: [ :each | self includes: each ]);
		yourself