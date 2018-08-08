printing
storeOn: aStream
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' read: ';
		store: self readSelector;
		nextPutAll: ' write: ';
		store: self writeSelector;
		nextPut: $)