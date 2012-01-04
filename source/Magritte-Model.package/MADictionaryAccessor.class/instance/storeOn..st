printing
storeOn: aStream
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' key: ';
		store: self key;
		nextPut: $)