printing
printOn: aStream
	(self tag isDescription and: [ self tag label notNil ])
		ifTrue: [ aStream nextPutAll: self tag label; nextPutAll: ': ' ].
	aStream nextPutAll: self messageText