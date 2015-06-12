printing
storeOn: aStream
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' name: ';
		store: self name;
		nextPut: $)