*Magritte-GToolkit
maFor: anObject using: aDescription
	| s |
	s := MAGtDescriptionStorageStrategy new
		description: aDescription;
		object: anObject;
		yourself.
	^ self new 
		strategy: s;
		read