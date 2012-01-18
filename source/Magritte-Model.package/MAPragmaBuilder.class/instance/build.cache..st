private
build: anObject cache: cache
	| container |
	container := cache at: anObject put: (self buildContainer: anObject).
	
	^ container
		addAll: (self buildDescriptions: anObject);
		yourself.
