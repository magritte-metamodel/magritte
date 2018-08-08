comparing
= anObject
	^ super = anObject
		and: [ self readBlock = anObject readBlock
		and: [ self writeBlock = anObject writeBlock ] ]