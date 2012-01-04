printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' label: '; print: self label.
	aStream nextPutAll: ' comment: '; print: self comment