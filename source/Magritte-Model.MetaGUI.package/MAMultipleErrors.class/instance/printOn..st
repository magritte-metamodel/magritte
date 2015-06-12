printing
printOn: aStream
	self collection
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream nextPut: Character cr ]