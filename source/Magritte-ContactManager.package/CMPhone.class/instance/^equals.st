comparing
= anObject
	^ self species = anObject species
		and: [ self kind = anObject kind
		and: [ self number = anObject number ] ]