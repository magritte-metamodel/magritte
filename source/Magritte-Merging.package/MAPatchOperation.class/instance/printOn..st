printing
printOn: aStream

	aStream
		nextPutAll: 'Change ';
		nextPutAll: field label;
		nextPutAll: ' from ';
		print: oldValue;
		nextPutAll: ' to ';
		print: newValue