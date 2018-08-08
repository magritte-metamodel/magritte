printing
storeOn: aStream
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' on: ';
		store: self next;
		nextPutAll: ' accessor: ';
		store: self accessor;
		nextPut: $)