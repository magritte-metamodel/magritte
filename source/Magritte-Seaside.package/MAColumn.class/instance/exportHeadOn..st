exporting
exportHeadOn: aStream
	self label isNil
		ifFalse: [ aStream nextPutAll: self label ]