*Magritte-Developer
storeVia: anAccessor inDescriptionOn: aStream
	aStream
		nextPutAll: anAccessor writeSelector , ' (';
		store: self;
		nextPutAll: ');';
		cr