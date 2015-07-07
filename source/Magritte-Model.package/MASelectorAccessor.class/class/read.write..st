instance creation
read: aReadSelector write: aWriteSelector
	^ self new
		readSelector: aReadSelector;
		writeSelector: aWriteSelector;
		yourself