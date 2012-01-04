accessing
for: anObject
	^ cache at: anObject ifAbsentPut: [ self build: anObject ]