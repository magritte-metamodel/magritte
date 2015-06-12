instance creation
read: aReadBlock write: aWriteBlock
	^ self new
		readBlock: aReadBlock;
		writeBlock: aWriteBlock;
		yourself