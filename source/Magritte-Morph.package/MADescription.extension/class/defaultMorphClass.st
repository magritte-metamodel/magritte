*magritte-morph-defaults
defaultMorphClass
	^ self defaultMorphClasses notEmpty
		ifTrue: [ self defaultMorphClasses first ]