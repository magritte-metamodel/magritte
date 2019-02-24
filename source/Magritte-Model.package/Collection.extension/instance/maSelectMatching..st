*Magritte-Model
maSelectMatching: aString 
	^ self select: [ :e | e asString startsWith: aString ]