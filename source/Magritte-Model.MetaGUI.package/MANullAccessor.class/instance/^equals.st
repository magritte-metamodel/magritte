comparing
= anObject
	^ super = anObject
		and: [ self uuid = anObject uuid ]