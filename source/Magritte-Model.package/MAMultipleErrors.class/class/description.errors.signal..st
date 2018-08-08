instance creation
description: aDescription errors: aCollection signal: aString 
	^ self new
		setDescription: aDescription;
		setCollection: aCollection;
		signal: aString;
		yourself