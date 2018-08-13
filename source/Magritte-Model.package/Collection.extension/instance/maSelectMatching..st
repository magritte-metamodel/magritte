*magritte-model-dynopt
maSelectMatching: aString 
	^ self select: [ :e | e asString startsWith: aString ]