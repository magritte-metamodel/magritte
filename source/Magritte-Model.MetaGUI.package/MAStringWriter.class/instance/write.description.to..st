visiting
write: anObject description: aDescription to: aStream
	anObject isNil 
		ifTrue: [ aStream nextPutAll: aDescription undefined ]
		ifFalse: [ super write: anObject description: aDescription to: aStream ].
	^ aStream contents