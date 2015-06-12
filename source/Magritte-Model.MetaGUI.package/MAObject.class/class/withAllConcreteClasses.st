reflection
withAllConcreteClasses
	^ Array streamContents: [ :stream |
		self withAllConcreteClassesDo: [ :each |
			stream nextPut: each ] ]