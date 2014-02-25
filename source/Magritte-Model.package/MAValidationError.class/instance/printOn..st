printing
printOn: aStream
	(self tag isDescription and: [ self tag label notNil ])
		ifTrue: [ aStream nextPutAll: self tag label greaseString; nextPutAll: ': ' ].
	aStream nextPutAll: self messageText greaseString 