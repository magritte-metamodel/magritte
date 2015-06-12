printing
storeOn: aStream
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' uuid: ';
		store: self uuid;
		nextPut: $)