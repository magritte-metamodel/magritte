printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' model: '; print: self model