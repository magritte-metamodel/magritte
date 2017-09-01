as yet unclassified
printOn: aStream

	aStream
		nextPutAll: 'Change ';
		nextPutAll: field surroundedBySingleQuotes;
		nextPutAll: ' from ';
		print: oldValue;
		nextPutAll: ' to ';
		print: newValue