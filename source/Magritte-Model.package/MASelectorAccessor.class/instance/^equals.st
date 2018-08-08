comparing
= anObject
	^ super = anObject
		and: [ self readSelector = anObject readSelector
		and: [ self writeSelector = anObject writeSelector ] ]