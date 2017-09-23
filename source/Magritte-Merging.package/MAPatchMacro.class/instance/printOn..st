printing
printOn: aStream

	model 
		ifNotNil: [ 
			aStream
				nextPutAll: 'Patch for ';
				print: model ]
		ifNil: [ super printOn: aStream ]