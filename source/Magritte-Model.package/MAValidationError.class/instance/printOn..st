printing
printOn: aStream
	(self tag isDescription and: [ self tag label notNil ])
		ifTrue: [ self tag label printOn: aStream. aStream nextPutAll: ': ' ].
	self messageText printOn: aStream