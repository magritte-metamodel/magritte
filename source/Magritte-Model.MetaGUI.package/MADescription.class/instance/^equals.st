comparing
= anObject
	^ super = anObject
		and: [ self accessor = anObject accessor ]